class AiRoutinesController < ApplicationController
  before_action :set_ai_routine, only: [:show, :edit, :update, :destroy]

  # GET /ai_routines
  # GET /ai_routines.json
  def index
    @ai_routines = AiRoutine.all
  end

  # GET /ai_routines/1
  # GET /ai_routines/1.json
  def show
  end

  # GET /ai_routines/new
  def new
    @ai_routine = AiRoutine.new
  end

  # GET /ai_routines/1/edit
  def edit
  end

  # POST /ai_routines
  # POST /ai_routines.json
  def create
    @ai_routine = AiRoutine.new(ai_routine_params)

    respond_to do |format|
      if @ai_routine.save
        format.html { redirect_to action: :index, notice: 'Ai routine was successfully created.' }
        format.json { render :show, status: :created, location: @ai_routine }
      else
        format.html { render :new }
        format.json { render json: @ai_routine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ai_routines/1
  # PATCH/PUT /ai_routines/1.json
  def update
    respond_to do |format|
      if @ai_routine.update(ai_routine_params)
        format.html { redirect_to action: :index, notice: 'Ai routine was successfully updated.' }
        format.json { render :show, status: :ok, location: @ai_routine }
      else
        format.html { render :edit }
        format.json { render json: @ai_routine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ai_routines/1
  # DELETE /ai_routines/1.json
  def destroy
    @ai_routine.destroy
    respond_to do |format|
      format.html { redirect_to ai_routines_url, notice: 'Ai routine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ai_routine
      @ai_routine = AiRoutine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ai_routine_params
      params.require(:ai_routine).permit(:name)
    end
end
