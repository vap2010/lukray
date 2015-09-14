json.array!(@admin_photos) do |admin_photo|
  json.extract! admin_photo, :id, :position, :category_id, :is_deleted, :is_published, :is_shown_in_menu, :is_preview_published, :skin_id, :title, :menu_title, :announce, :body
  json.url admin_photo_url(admin_photo, format: :json)
end
