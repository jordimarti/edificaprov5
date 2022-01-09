json.extract! video, :id, :channel_id, :title, :score, :visible, :publicid, :playback_id, :policy, :mux_asset_id, :status, :max_stored_resolution, :max_stored_frame_rate, :duration, :aspect_ratio, :created_at, :updated_at
json.url video_url(video, format: :json)
