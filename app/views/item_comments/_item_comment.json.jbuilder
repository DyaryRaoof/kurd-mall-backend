json.extract! item_comment, :id, :item_id, :user_id, :user_name, :description, :created_at, :updated_at
json.url item_comment_url(item_comment, format: :json)
