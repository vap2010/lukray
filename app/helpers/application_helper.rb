module ApplicationHelper




  def footer_li_link(pid) 
    page = Page.find_by_id(pid) 
    if page and page.am_i_published?
      "<li>#{link_to page.menu_title, page.url}</li>"
    else
      ''
    end
  end

  def view_main_menu
    pages = Page.menu_points.where(:parent_id => nil).offset(1)
  end
  
  def view_main_submenu(page)
    pages = page.children.menu_points 
    if pages.empty?
      page = nil
      page = page if page and page.is_announce_view?
      return [page, []]
    else  
      if false # pages.first.is_announce_view?
        return [pages.first, pages.offset(1)]
      else
        return [nil, pages]
      end
    end
  end

  def is_main_page?
    action_name == 'home' and controller_name == 'main'
  end
  
  def okno(val)
    val ? 'Ok' : '-' 
  end
  
  
  def show_select_stat_in_table(stats)
    res = ''
    stats.sort{|s1, s2| s1[0] <=> s2[0]}.each do |st| 
      if st[1].to_s.to_i > 0
        res += "<tr><td>#{st[0].to_s}</td><td>#{st[1].to_s}</td></tr>\n"
      end
    end
    res
  end
  
  
  
end
