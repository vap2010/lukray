class Admin::Homestead < Homestead
  self.table_name = "homesteads"

 
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

