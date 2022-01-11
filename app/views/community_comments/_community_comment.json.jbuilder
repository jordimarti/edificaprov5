json.extract! community_comment, :id, :user_id, :community_id, :created_at, :updated_at
json.url community_comment_url(community_comment, format: :json)
