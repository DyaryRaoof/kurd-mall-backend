json.extract! store_comment, :id, :store_id, :user_id, :user_name, :description, :created_at, :updated_at
json.url store_comment_url(store_comment, format: :json)
