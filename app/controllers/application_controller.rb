class ApplicationController < ActionController::Base
    # Use this line to allow the params to be parsed as JSON
    protect_from_forgery with: :null_session
end
