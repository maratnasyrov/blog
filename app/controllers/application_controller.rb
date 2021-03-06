class ApplicationController < ActionController::Base
  include Authentication
  include Authorization

  expose(:article)

  protect_from_forgery with: :exception
  responders :flash

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end
end
