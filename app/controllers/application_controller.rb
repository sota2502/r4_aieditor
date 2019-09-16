class ApplicationController < ActionController::Base
  before_action :basic_auth

  private

    def basic_auth
      basic_authentication = Settings.basic_authentication
      authenticate_or_request_with_http_basic do |user, password|
        user == basic_authentication.user &&
          password == basic_authentication.password
      end
    end
end
