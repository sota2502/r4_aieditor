class RatesForm
  include ActiveModel::Model

  def initialize(rates_params = {})
    @rates_params = rates_params
  end  

  def save
    action_state_id = @rates_params[:action_state_id]
    rates = rate_instances(action_state_id) + new_rate_instances(action_state_id)
    Rate.import rates, on_duplicate_key_update: [:name, :value]
  end

  private

    def rate_instances(action_state_id)
      @rates_params[:rate][:rates].to_h.map do |_, param|
        Rate.new(param.merge(action_state_id: action_state_id))
      end.select(&:valid?)
    end

    def new_rate_instances(action_state_id)
      @rates_params[:rate][:new_rates].to_a.map do |param|
        Rate.new(param.merge(action_state_id: action_state_id))
      end.select(&:valid?)
    end
end
