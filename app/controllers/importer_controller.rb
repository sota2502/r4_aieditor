class ImporterController < ApplicationController
  include Projectable

  def index
    render :index
  end

  def create
    file = import_params[:file]
    if file.nil?
      @notice = "Please select file"
      return render action: :index
    end

    # render plain: import_params[:file].read.encode("UTF-8", "Shift_JIS")
    redirect_to project, notice: 'Project was successfully imported.'
  end

  private
    def import_params
      params.permit(:project_id, :file)
    end
end
