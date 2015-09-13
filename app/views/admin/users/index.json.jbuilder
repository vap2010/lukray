json.array!(@admin_users) do |admin_user|
  json.extract! admin_user, :id, :blocked, :type_id, :status_id, :role_id, :phone, :mobile, :name, :surname, :patronymic
  json.url admin_user_url(admin_user, format: :json)
end
