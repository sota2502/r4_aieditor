class ActionRoutinesController < ApplicationController
  include Projectable
  include Exactionable
  before_action :set_hp_condition
  before_action :set_action_routine, only: [:update, :destroy]

  # POST /action_routines
  # POST /action_routines.json
  def create
    ActionRoutinesForm.new(action_routine_params).save
    redirect_to [project, exaction, @hp_condition]
  end

  # PATCH/PUT /action_routines/1
  # PATCH/PUT /action_routines/1.json
  def update
    @action_routine.update(action_routine_params)
    redirect_to [project, exaction, @hp_condition]
  end

  # DELETE /action_routines/1
  # DELETE /action_routines/1.json
  def destroy
    @action_routine.destroy
    respond_to do |format|
      format.html { redirect_to [project, exaction, @hp_condition], notice: 'Action routine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_hp_condition
      @hp_condition = HpCondition.find(params[:hp_condition_id])
    end

    def set_action_routine
      @action_routine = ActionRoutine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def action_routine_params
      params.permit(:hp_condition_id,
                    action_routine: {
                      action_routines: [:id, :search_id, :target_value, :motion_id, :rate_id, :rate_coefficient,
                                        :cancel_type_id, :action_chain_id],
                      new_action_routines: [:search_id, :target_value, :motion_id, :rate_id, :rate_coefficient,
                                            :cancel_type_id, :action_chain_id]
                    })
    end
end
