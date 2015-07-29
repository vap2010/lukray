json.array!(@admin_meta_tags) do |admin_meta_tag|
  json.extract! admin_meta_tag, :id, :title, :description, :keywords, :url, :metatagable_id, :metatagable_type, :no_cache, :noindex, :nofollow, :is_redirect, :redirect_uri, :hits_count
  json.url admin_meta_tag_url(admin_meta_tag, format: :json)
end
