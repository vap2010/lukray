json.array!(@admin_pages) do |admin_page|
  json.extract! admin_page, :id, :parent_id, :position, :is_deleted, :is_published, :is_shown_in_menu, :is_preview_published, :title, :menu_title, :announce, :body
  json.url admin_page_url(admin_page, format: :json)
end
