class HpConditionsController < ApplicationController
  before_action :set_ai_routine
  def index
    if params[:hp_condition_id]
      redirect_path = Rails.application.routes.url_helpers.ai_routine_hp_condition_target_action_conditions_path(
        @ai_routine, params[:hp_condition_id])
      return redirect_to redirect_path
    end
  end

  private

    def set_ai_routine
      @ai_routine = AiRoutine.find(params[:ai_routine_id])
    end
end
