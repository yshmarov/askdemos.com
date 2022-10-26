json.extract! inbox, :id, :title, :description, :user_id, :status, :created_at, :updated_at
json.url inbox_url(inbox, format: :json)
