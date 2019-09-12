class ActionGroupsController < ApplicationController
  before_action :set_action_group, only: [:show, :edit, :update, :destroy]

  # GET /action_groups
  # GET /action_groups.json
  def index
    @action_groups = ActionGroup.all
  end

  # GET /action_groups/1
  # GET /action_groups/1.json
  def show
    @action_rules = @action_group.action_rules
  end

  # GET /action_groups/new
  def new
    @action_group = ActionGroup.new
  end

  # GET /action_groups/1/edit
  def edit
  end

  # POST /action_groups
  # POST /action_groups.json
  def create
    @action_group = ActionGroup.new(action_group_params)

    respond_to do |format|
      if @action_group.save
        format.html { redirect_to @action_group, notice: 'Action group was successfully created.' }
        format.json { render :show, status: :created, location: @action_group }
      else
        format.html { render :new }
        format.json { render json: @action_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /action_groups/1
  # PATCH/PUT /action_groups/1.json
  def update
    respond_to do |format|
      if @action_group.update(action_group_params)
        format.html { redirect_to @action_group, notice: 'Action group was successfully updated.' }
        format.json { render :show, status: :ok, location: @action_group }
      else
        format.html { render :edit }
        format.json { render json: @action_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /action_groups/1
  # DELETE /action_groups/1.json
  def destroy
    @action_group.destroy
    respond_to do |format|
      format.html { redirect_to action_groups_url, notice: 'Action group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_action_group
      @action_group = ActionGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def action_group_params
      params.fetch(:action_group, {}).permit(:name)
    end
end
