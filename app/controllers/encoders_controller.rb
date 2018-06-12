class EncodersController < ApplicationController
  def index
    @encoders = zype_client.encoders.all['encoders']
  end
end
