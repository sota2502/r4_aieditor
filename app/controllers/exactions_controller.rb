class ExactionsController < ApplicationController
  include Projectable
  before_action :set_exaction, only: [:show, :edit, :update, :destroy]

  # GET /exactions
  # GET /exactions.json
  def index
    @exactions = Exaction.all
  end

  # GET /exactions/1
  # GET /exactions/1.json
  def show
    respond_to do |format|
      format.html { render :show }
      format.text do
        data = LuaScript::Dumper.dump_with_func('exaction', @exaction.for_lua).encode('Shift_JIS')
        name = @exaction.name + '.lua'
        send_data(data, filename: name)
      end
    end
  end

  # GET /exactions/new
  def new
    @exaction = Exaction.new
  end

  # GET /exactions/1/edit
  def edit
  end

  # POST /exactions
  # POST /exactions.json
  def create
    @exaction = Exaction.new(exaction_params)

    respond_to do |format|
      if @exaction.save
        format.html { redirect_to [project, @exaction], notice: 'Exaction was successfully created.' }
        format.json { render :show, status: :created, location: @exaction }
      else
        format.html { render :new }
        format.json { render json: @exaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exactions/1
  # PATCH/PUT /exactions/1.json
  def update
    respond_to do |format|
      if @exaction.update(exaction_params)
        format.html { redirect_to [project, @exaction], notice: 'Exaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @exaction }
      else
        format.html { render :edit }
        format.json { render json: @exaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exactions/1
  # DELETE /exactions/1.json
  def destroy
    @exaction.destroy
    respond_to do |format|
      format.html { redirect_to project, notice: 'Exaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exaction
      @exaction = Exaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exaction_params
      params.require(:exaction).permit(:project_id, :name)
    end
end
