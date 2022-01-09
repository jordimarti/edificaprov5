json.extract! channel, :id, :account_id, :name, :privacy, :subscribers, :main_community, :created_at, :updated_at
json.url channel_url(channel, format: :json)
