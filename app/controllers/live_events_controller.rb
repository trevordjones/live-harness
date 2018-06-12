class LiveEventsController < ApplicationController
  rescue_from Zype::Client::UnprocessableEntity, with: :unprocessable
  def index
    @live_events = zype_client.live_events.all(params: { active: 'all' })
  end

  def show
    @live_event = zype_client.live_events.find(id: params[:id])
  end

  def edit
    @live_event = zype_client.live_events.find(id: params[:id])
  end

  def create
    @live_event = zype_client.live_events.create(params: event_params)

    redirect_to live_event_path(@live_event['_id'])
  end

  def update
    @live_event = zype_client.live_events.update(id: params[:id], params: event_params)

    redirect_to live_event_path(@live_event['_id'])
  end

  def destroy
  end

  private

  def event_params
    new_params = {}.tap do |hash|
      hash[:encoder_name] = params[:encoder_name]
      hash[:title] = params[:title]
      hash[:description] = params[:description]
      hash[:event_type] = params[:event_type]
      hash[:dvr_duration] = params[:dvr_duration]
      hash[:rental_duration] = params[:rental_duration]
      hash[:rental_price] = params[:rental_price] if params[:rental_price].present?
      hash[:purchase_price] = params[:purchase_price] if params[:purchase_price].present?
      hash[:auto_archive] = params[:auto_archive]
      hash[:auto_manage_encoder] = params[:auto_manage_encoder]
      hash[:subscription_required] = params[:monetization_type] == 'subscription_required'
      hash[:pass_required] = params[:monetization_type] == 'pass_required'
      hash[:purchase_required] = params[:monetization_type] == 'purchase_required'
      hash[:rental_required] = params[:monetization_type] == 'rental_required'
      hash[:on_air_at] = params[:on_air_at]
      hash[:off_air_at] = params[:off_air_at]
    end

    { live_event: new_params }
  end

  def unprocessable(exception)
    binding.pry
  end
end
