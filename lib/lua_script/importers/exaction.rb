module LuaScript
  module Importers
    class Exaction
      class << self
        def import(project, table)
          exaction = ::Exaction.includes(hp_conditions: :action_routines)
                               .find_or_initialize_by(project: project, name: table['name'])
          exaction.save!

          import_hp_conditions(project, exaction, table)
        end

        private

          def import_hp_conditions(project, exaction, table)
            hp_condition_table = table['condition'].zip(table['action'])
            hp_condition_table.each do |value, routines|
              hp_condition = exaction.hp_conditions.find_or_initialize_by(value: value)
              hp_condition.save!

              hp_condition.action_routines.destroy_all
              routines.map do |attrs|
                hp_condition.action_routines.create(
                  action_routine_params(project, attrs)
                )
              end
            end
          end

          def action_routine_params(project, attrs)
            action_state = project.action_state
            action_chains= project.action_chains
            rate_cols = attrs['rate'] || [nil, nil]
            rate = if rate_cols[0].present?
                     action_state.rates.find_by(name: rate_cols[0])
                   else
                     nil
                   end
            {
              search: action_state.searches.find_by(name: attrs['search']),
              target_value: attrs['target'],
              action_chain: action_chains.find_by(name: attrs['action']),
              motion_id: Motion.find_by_name(attrs['motion'])&.id,
              rate: rate,
              rate_coefficient: rate_cols[1]
            }
          end
      end
    end
  end
end
