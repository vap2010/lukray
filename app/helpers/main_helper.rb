module MainHelper


  def areas_for_map(homesteads)
    areas = ''
    homesteads.each do |h|
      if h.show_on_map
        areas += "<area shape=\"poly\" alt=\"#{h.id}\" title=\"#{h.id}\" href=\"\" target=\"\" data-type=\"#{h.actual_status_id.to_s}\" coords=\"#{h.coords}\" />"
      end
    end
    raw areas
  end

end
