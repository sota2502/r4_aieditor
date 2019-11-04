class TargetsController < ApplicationController
  include Projectable
  include ActionStatable

  before_action :set_target, only: [:update, :destroy]

  # GET /targets
  # GET /targets.json
  def index
    @target = Target.new
    @targets = Target.all
  end

  # POST /targets
  # POST /targets.json
  def create
    TargetsForm.new(target_params).save

    respond_to do |format|
      format.html { redirect_to after_write_path, notice: 'Targets were successfully created.' }
      format.json { render :show, status: :created, location: @target }
    end
  end

  # PATCH/PUT /targets/1
  # PATCH/PUT /targets/1.json
  def update
    respond_to do |format|
      if @target.update(target_params)
        format.html { redirect_to after_write_path }
        format.json { render :show, status: :ok, location: @target }
      end
    end
  end

  # DELETE /targets/1
  # DELETE /targets/1.json
  def destroy
    @target.destroy
    respond_to do |format|
      format.html { redirect_to after_write_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_target
      @target = Target.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def target_params
      params.permit(:project_id, :action_state_id, target: {targets: [:id, :value]})
    end

    def after_write_path
      project_action_state_targets_path(project, action_state)
    end
end
