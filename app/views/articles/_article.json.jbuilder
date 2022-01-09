json.extract! article, :id, :channel_id, :title, :score, :created_at, :updated_at
json.url article_url(article, format: :json)
