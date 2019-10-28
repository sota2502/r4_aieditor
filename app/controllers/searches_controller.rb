class SearchesController < ApplicationController
  include Projectable
  include ActionStatable

  before_action :set_search, only: [:update, :destroy]

  # GET /searches
  # GET /searches.json
  def index
    @search = Search.new
    @searches = Search.all
  end

  # POST /searches
  # POST /searches.json
  def create
    @search = Search.new(search_params)

    respond_to do |format|
      if @search.save
        format.html { redirect_to after_write_path }
        format.json { render :show, status: :created, location: @search }
      end
    end
  end

  # PATCH/PUT /searches/1
  # PATCH/PUT /searches/1.json
  def update
    respond_to do |format|
      if @search.update(search_params)
        format.html { redirect_to after_write_path }
        format.json { render :show, status: :ok, location: @search }
      end
    end
  end

  # DELETE /searches/1
  # DELETE /searches/1.json
  def destroy
    @search.destroy
    respond_to do |format|
      format.html { redirect_to after_write_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.require(:search).permit(:action_state_id, :name, :x1, :y1, :x2, :y2)
    end

    def after_write_path
      project_action_state_searches_path(project, action_state)
    end
end
