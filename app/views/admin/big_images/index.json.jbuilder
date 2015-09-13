json.array!(@admin_big_images) do |admin_big_image|
  json.extract! admin_big_image, :id, :position, :is_public, :is_deleted, :category_id, :title, :params
  json.url admin_big_image_url(admin_big_image, format: :json)
end
