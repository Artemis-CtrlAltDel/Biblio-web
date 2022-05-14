class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include ResposessionsHelper
    include AdherentsessionsHelper
end
