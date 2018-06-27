class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from Zype::Client::NotFound, with: :not_found
  rescue_from Zype::Client::Unauthorized, with: :unauthorized
  rescue_from Zype::Client::UnprocessableEntity, with: :unprocessable_entity
  rescue_from Zype::Client::ServerError, with: :server_error

  private

  def zype_client
    @zype_client ||= Zype::Client
  end

  def not_found
    # handle error
  end

  def unauthorized
  end

  def unprocessable_entity
  end

  def server_error
  end
end
