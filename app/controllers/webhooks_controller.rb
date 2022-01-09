class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    information = request.raw_post
    result = JSON.parse(information)
    puts "DATA PARSED"
    puts result['type']

    case result['type']
    when 'video.asset.ready'
      video = Video.find_by(mux_asset_id: result['object']['id'])
      video.status = result['data']['status']
      video.max_stored_resolution =  result['data']['max_stored_resolution']
      video.save
    end
  end
end