module Projectable
  extend ActiveSupport::Concern

  included do
    helper_method :project
  end

  def project
    @project = Project.find(params[:project_id])
  end
end
