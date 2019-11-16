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

    lua_string = import_params[:file].read.encode("UTF-8", "Shift_JIS")
    LuaScript::Importer.new(project, lua_string).import
    redirect_to project, notice: 'Project was successfully imported.'
  rescue => error
    @notice = error
    render action: :index
  end

  private
    def import_params
      params.permit(:project_id, :file)
    end
end
