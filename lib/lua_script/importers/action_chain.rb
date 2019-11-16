module LuaScript
  module Importers
    class ActionChain
      class << self
        def import(project, table)
          action_chain = ::ActionChain.includes(:action_rules, :action_chain_cancels, :cancel_conditions)
                                      .find_or_initialize_by(project: project, name: table['name'])
          action_chain.save!

          project.cancel_conditions.destroy_all
          cancel_conditions = table['cancel'].map { |v| create_cancel_condition(project, v) }
          cancel_conditions.each { |cc| action_chain.add_cancel_condition(cc) }
          import_action_rules(project, action_chain, table)
        end

        private

          def import_action_rules(project, action_chain, table)
            action_state = project.action_state
            action_chain.action_rules.destroy_all
            rule_keys = table.keys.select { |e| e.is_a?(Numeric) }.sort
            action_rules = rule_keys.map do |key|
              rule = table[key]
              action_rule = action_chain.action_rules.new(
                motion_id: Motion.find_by_name(rule['motion'])&.id,
                move_x: rule['move']&.at(0),
                move_y: rule['move']&.at(1),
                next: rule['next'],
                search_id: action_state.searches.find_by(name: rule['search'])&.id,
                target_value: rule['target'],
                hold: rule['hold'],
                way_id: rule['way']
              )
              action_rule.save!
              cancel_conditions = rule['cancel'].map { |v| create_cancel_condition(project, v) }
              cancel_conditions.each { |cc| action_rule.add_cancel_condition(cc) }
            end
          end

          def create_cancel_condition(project, attrs)
            rate = if attrs[1].present?
                     project.action_state.rates.find_by(name: attrs[1]&.at(0))
                   else
                     nil
                   end
            project.cancel_conditions.create(
              cancel_type_id: attrs[0],
              rate: rate,
              rate_coefficient: attrs[1]&.at(1),
              parameter1: attrs[2],
              parameter2: attrs[3]
            )
          end
      end
    end
  end
end
