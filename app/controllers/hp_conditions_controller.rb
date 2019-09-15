class HpConditionsController < ApplicationController
  before_action :set_ai_routine
  def index
  end

  private

    def set_ai_routine
      @ai_routine = AiRoutine.find(params[:ai_routine_id])
    end
end
