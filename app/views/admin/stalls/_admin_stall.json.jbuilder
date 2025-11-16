json.extract! stall, :id, :name, :description, :festival_id, :user_id, :status_text, :auth_code, :created_at, :updated_at
json.url admin_stall_url(stall, format: :json)
