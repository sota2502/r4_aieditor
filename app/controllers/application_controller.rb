class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :set_cache_headers
  before_action :set_sidebar

  private

    def basic_auth
      basic_authentication = Settings.basic_authentication
      authenticate_or_request_with_http_basic do |user, password|
        user == basic_authentication.user &&
          password == basic_authentication.password
      end
    end

    def set_cache_headers
      response.headers["Cache-Control"] = "no-cache, no-store"
      response.headers["Pragma"] = "no-cache"
      response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
    end

    def set_sidebar
      @projects_for_sidebar = Project.includes(:action_state, :action_chains, :exaction).all
    end
end
