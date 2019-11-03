class ActionsController < ApplicationController
  include Projectable
  include Exactionable
  before_action :set_hp_condition
  before_action :set_action_routine, only: [:update, :destroy]

  def create
    action = Action.new(action_params)
    action.save
    redirect_to [project, exaction, @hp_condition] 
  end

  def update
    @action.update(action_params)
    redirect_to [project, exaction, @hp_condition] 
  end

  def destroy
    @action.destroy
    redirect_to [project, exaction, @hp_condition] 
  end

  private

    def set_hp_condition
      @hp_condition = HpCondition.find(params[:hp_condition_id])
    end

    def set_action
      @action = Action.find(params[:id])
    end

    def action_params
      params.require(:action)
            .permit(:search_id, :target_value, :motion_id, :rate_id, :rate_coefficient,
                    :cancel_type_id, :action_chain_id)
    end
end
