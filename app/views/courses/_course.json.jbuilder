json.extract! course, :id, :channel_id, :title, :description, :created_at, :updated_at
json.url course_url(course, format: :json)
