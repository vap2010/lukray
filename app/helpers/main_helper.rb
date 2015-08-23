module MainHelper


  def areas_for_map(homesteads)
    areas = ''
    homesteads.each do |h|
      areas += "<area shape=\"poly\" alt=\"#{h.id}\" title=\"#{h.id}\" href=\"\" target=\"\" data-type=\"#{h.status_id}\" coords=\"#{h.coords}\" />"
    end
    raw areas
  end

end
