class Admin::Homestead < Homestead
  self.table_name = "homesteads"



  # Admin::Homestead.set_status_ids
  def self.set_status_ids
    n = 0
    self.all.each do |h| 
      h.status_id = 1
      if h.land_use_id == 3 and h.phase > 0
        h.status_id = 2
        n += 1 if h.save
      end    
      h.save
    end
    puts "Ok = #{n}"
  end

 
end

=begin


  domain_id:integer          номер  территории
  land_use_id:integer        категория использования
  site_num:string            номер участка (ду)
  cadastral_num:string       кадастровый номер
  phase:integer              очередь ввода
  status_id:integer          статус участка
  t.datetime :booked_date   забронировано до
  acreage_s:string           площадь в сотках
  price:string               цена за участок
  discount:string            скидка/наценка
  has_coast:boolean          имеет выход на берег
  has_forest:boolean         граничит с лесом
  corner_site:boolean        угловой участок
  outside_site:boolean       крайний участок
  land_link_id:integer       связь с парным участком
  shape_id:integer           форма участка
  slope:string               уклон, крутизна
  altitude:integer           высота на морем
  k_interes:integer          число интересов
  k_browsing:integer         число просмотрв
  neighbors:string           id соседних участков
  note:text                  комментарий       
  
=end

