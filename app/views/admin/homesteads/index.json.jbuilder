json.array!(@admin_homesteads) do |admin_homestead|
  json.extract! admin_homestead, :id, :domain_id, :land_use_id, :site_num, :cadastral_num, :phase, :status_id, :acreage_s, :price, :discount, :has_coast, :has_forest, :corner_site, :outside_site, :land_link_id, :shape_id, :slope, :altitude, :k_interes, :k_browsing, :neighbors, :note
  json.url admin_homestead_url(admin_homestead, format: :json)
end
