json.extract! question_comment, :id, :user_id, :question_id, :created_at, :updated_at
json.url question_comment_url(question_comment, format: :json)
