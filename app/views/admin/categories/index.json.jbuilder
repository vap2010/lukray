json.array!(@admin_categories) do |admin_category|
  json.extract! admin_category, :id, :position, :is_deleted, :is_published, :type_id, :title, :image, :text
  json.url admin_category_url(admin_category, format: :json)
end
