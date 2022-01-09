class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    result = JSON.parse(request.raw_post)

    case result['type']
    when 'video.asset.ready'
      video = Video.find_by(mux_asset_id: result['object']['id'])
      video.status = result['data']['status']
      video.max_stored_resolution =  result['data']['max_stored_resolution']
      video.max_stored_frame_rate =  result['data']['max_stored_frame_rate']
      video.duration = result['data']['duration']
      video.aspect_ratio = result['data']['aspect_ratio']
      video.save
    end
  end
end