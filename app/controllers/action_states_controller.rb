class ActionStatesController < ApplicationController
  include Projectable
  before_action :set_action_state, only: [:show, :edit, :update, :destroy]

  # GET /action_states
  # GET /action_states.json
  def index
    @action_states = ActionState.all
  end

  # GET /action_states/1
  # GET /action_states/1.json
  def show
    respond_to do |format|
      format.html { render :show }
      format.text do
        data = LuaScript::Dumper.dump_with_func('actionstate', @action_state.for_lua)
        name = @action_state.chara + '.lua'
        send_data(data, filename: name)
      end
    end
  end

  # GET /action_states/new
  def new
    @action_state = ActionState.new
  end

  # GET /action_states/1/edit
  def edit
  end

  # POST /action_states
  # POST /action_states.json
  def create
    @action_state = ActionState.new(action_state_params)

    respond_to do |format|
      if @action_state.save
        format.html { redirect_to [project, @action_state], notice: 'Action state was successfully created.' }
        format.json { render :show, status: :created, location: @action_state }
      end
    end
  end

  # PATCH/PUT /action_states/1
  # PATCH/PUT /action_states/1.json
  def update
    respond_to do |format|
      if @action_state.update(action_state_params)
        format.html { redirect_to [project, @action_state], notice: 'Action state was successfully updated.' }
        format.json { render :show, status: :ok, location: @action_state }
      end
    end
  end

  # DELETE /action_states/1
  # DELETE /action_states/1.json
  def destroy
    @action_state.destroy
    respond_to do |format|
      format.html { redirect_to project, notice: 'Action state was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_action_state
      @action_state = ActionState.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def action_state_params
      params.require(:action_state).permit(:project_id, :chara, :field, :freq, :precis)
    end
end
