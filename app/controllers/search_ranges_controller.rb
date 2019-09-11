class SearchRangesController < ApplicationController
  before_action :set_search_range, only: [:show, :edit, :update, :destroy]

  # GET /search_ranges
  # GET /search_ranges.json
  def index
    @search_ranges = SearchRange.all
  end

  # GET /search_ranges/1
  # GET /search_ranges/1.json
  def show
  end

  # GET /search_ranges/new
  def new
    @search_range = SearchRange.new
  end

  # GET /search_ranges/1/edit
  def edit
  end

  # POST /search_ranges
  # POST /search_ranges.json
  def create
    @search_range = SearchRange.new(search_range_params)

    respond_to do |format|
      if @search_range.save
        format.html { redirect_to action: :index }
        format.json { render :show, status: :created, location: @search_range }
      else
        format.html { render :new }
        format.json { render json: @search_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /search_ranges/1
  # PATCH/PUT /search_ranges/1.json
  def update
    respond_to do |format|
      if @search_range.update(search_range_params)
        format.html { redirect_to action: :index }
        format.json { render :show, status: :ok, location: @search_range }
      else
        format.html { render :edit }
        format.json { render json: @search_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /search_ranges/1
  # DELETE /search_ranges/1.json
  def destroy
    @search_range.destroy
    respond_to do |format|
      format.html { redirect_to search_ranges_url, notice: 'Search range was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search_range
      @search_range = SearchRange.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_range_params
      params.fetch(:search_range, {}).permit(:name, :left, :top, :right, :bottom)
    end
end
