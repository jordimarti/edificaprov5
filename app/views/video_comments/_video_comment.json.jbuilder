json.extract! video_comment, :id, :user_id, :video_id, :created_at, :updated_at
json.url video_comment_url(video_comment, format: :json)
