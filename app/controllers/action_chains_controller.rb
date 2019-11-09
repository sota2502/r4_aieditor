class ActionChainsController < ApplicationController
  include Projectable
  before_action :set_action_chain, only: [:show, :edit, :update, :destroy]

  # GET /action_chains
  # GET /action_chains.json
  def index
    @action_chains = project.action_chains
  end

  # GET /action_chains/1
  # GET /action_chains/1.json
  def show
    @action_rule = ActionRule.new
    respond_to do |format|
      format.html { render :show }
      format.text do
        data = LuaScript::Dumper.dump_with_func('actionchain', @action_chain.for_lua)
        name = @action_chain.name + '.lua'
        send_data(data, filename: name)
      end
    end
  end

  # GET /action_chains/new
  def new
    @action_chain = ActionChain.new
  end

  # GET /action_chains/1/edit
  def edit
  end

  # POST /action_chains
  # POST /action_chains.json
  def create
    @action_chain = ActionChain.new(action_chain_params)

    respond_to do |format|
      if @action_chain.save
        format.html { redirect_to [project, @action_chain], notice: 'Action chain was successfully created.' }
        format.json { render :show, status: :created, location: @action_chain }
      else
        format.html { render :new }
        format.json { render json: @action_chain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /action_chains/1
  # PATCH/PUT /action_chains/1.json
  def update
    respond_to do |format|
      if @action_chain.update(action_chain_params)
        format.html { redirect_to [project, @action_chain], notice: 'Action chain was successfully updated.' }
        format.json { render :show, status: :ok, location: @action_chain }
      else
        format.html { render :edit }
        format.json { render json: @action_chain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /action_chains/1
  # DELETE /action_chains/1.json
  def destroy
    @action_chain.destroy
    respond_to do |format|
      format.html { redirect_to project, notice: 'Action chain was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_action_chain
      @action_chain = ActionChain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def action_chain_params
      params.require(:action_chain).permit(:project_id, :name)
    end
end
