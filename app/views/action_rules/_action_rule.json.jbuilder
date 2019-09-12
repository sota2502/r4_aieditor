json.extract! action_rule, :id, :action_group_id, :name, :action_type_id, :next_act_timing_id, :holding_time, :velocity_x, :velocity_y, :created_at, :updated_at
json.url action_rule_url(action_rule, format: :json)
