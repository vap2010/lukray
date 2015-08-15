json.array!(@admin_messages) do |admin_message|
  json.extract! admin_message, :id, :is_actual, :is_deleted, :date, :category_id, :name, :phone, :email, :title, :body, :homestead_id
  json.url admin_message_url(admin_message, format: :json)
end
