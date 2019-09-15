target_action_conditions =
  ai_routine.target_action_conditions
            .group_by(&:hp_condition_id)
            .map do |hp_condition_id, conditions|
              arr = conditions.map do |cond|
                {
                  search_range: cond.search_range.name,
                  target_type: cond.target_type.name,
                  target_motion: cond.target_motion.name,
                  probability: {
                    name: cond.probability.name,
                    default_value: cond.probability.default_value,
                    correction_value: cond.probability.correction_value
                  },
                  probability_coefficient: cond.probability_coefficient,
                  previous_cancel_type: cond.previous_cancel_type,
                  action_group: {
                    id: 1,
                    name: cond.action_group.name
                  }
                }
              end

              [HpCondition.new(hp_condition_id).name, arr]
            end.to_h
hp_conditions = { hp_conditions: target_action_conditions }

json.extract! ai_routine, :id, :name
json.merge! hp_conditions
