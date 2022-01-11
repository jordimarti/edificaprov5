json.extract! lesson_comment, :id, :user_id, :lesson_id, :created_at, :updated_at
json.url lesson_comment_url(lesson_comment, format: :json)
