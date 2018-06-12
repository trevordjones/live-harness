class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def zype_client
    @zype_client ||= Zype::Client
  end
end
