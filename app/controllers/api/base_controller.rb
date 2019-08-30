class Api::BaseController < ActionController::Base
    before_action :set_cors_headers
    # skip_before_action :verify_authenticity_token
    private
        def set_cors_headers
        response.set_header "Access-Control-Allow-Origin", origin
        end

        def origin
        request.headers["Origin"] || "*"
        end
end