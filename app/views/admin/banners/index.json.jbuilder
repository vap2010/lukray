json.array!(@admin_banners) do |admin_banner|
  json.extract! admin_banner, :id, :position, :category_id, :is_deleted, :is_published, :has_link, :name, :title, :link, :text, :show_start, :show_end
  json.url admin_banner_url(admin_banner, format: :json)
end
