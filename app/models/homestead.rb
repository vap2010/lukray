class Homestead < ActiveRecord::Base


  
  scope :mkr1, -> { where(domain_id: 1) }
  scope :mkr2, -> { where(domain_id: 2) }
  scope :mkr3, -> { where(domain_id: 3) }
  scope :only_private_h, -> { where('sector_id != 10') }
  

  def self.get_select_name(ararname, key_name_id)  
    k = "#{ararname}_for_select".to_sym
    Hash[*Homestead.try(k).flatten].invert[key_name_id.to_s.to_i].gsub(/\(.*\)/,'')
    # Hash[*Homestead.try(:sectors_for_select).flatten]
  end

  def self.get_stat_for_select(select_name, db_key_sym)  
    k = "#{select_name.to_s}_for_select".to_sym
    arr = self.try(k).dup
    arr.each{|x| x[1] = self.where(db_key_sym => x[1]).size}
    arr
  end

  def self.domain_for_select
    [ ['Принадлежность к микрорайону не указана',     0],
      ['Большой участок у озера (микрорайон № 1.)',   1],
      ['Маленький лесной участок (микрорайон № 2.)',  2],
      ['Участок на опушке леса (микрорайон № 3.)',    3] ]
  end


  def sector_name
    self.class.get_select_name(:sectors, self.sector_id.to_s.to_i)
  end
  def self.sectors_for_select
    [ ['Принадлежность к сектору не указана',          0],
      ['Общественная зона',                           10],
      ['Западный берег (45 участков)',               101],
      ['Западный склон вдоль берега (55 участков)',  102],      
      ['Северная линия (36 участков)',               103],
      ['Высокий центр (18 участков)',                104],
      ['Северный центр (20 участок)',                105],      
      ['Южный берег (30 участков)',                  106],      
      ['Южный склон вдоль берега (23 участка)',      107],      
      ['Южный островок (6 участков)',                108],
      ['Южный центр (11 участков)',                  109],
      ['Южный центральный луч (19 участков)',        110]  ]
  end

  def self.land_use_for_select
    [ ['Категория использования земли не указана', 0],
      ['Для сельскохозяйственного производства',   1],
      ['Для крестьянско-фермерского хозяйства',    2],
      ['Для дачного строительства',                3],
      ['Земля населенного пункта',                 4] ]
  end

  def self.phases_for_select
    [ ['Очередь выставления в продажу не указана', 0],
      ['1-я очередь. Участок уже продается',       1],
      ['2-я очередь. Старт продаж май 2015г.',     2] ]
  end


  def status_name
    self.class.get_select_name(:status, self.status_id.to_s.to_i)
  end
  def self.status_for_select
    [ ['Статус не указан',            0],
      ['Участок не продается',        1],
      ['Свободен для приобретения',   2],
      ['Добавлен к сравнению',        3],
      ['Записан на просмотр',         4],
      ['Заявлен на аукцион',          5],
      ['Участок зарезервирован',      6],
      ['Участок забронирован',        7],
      ['Участок продан',              8],
      ['Это ваш дачный участок',      9] ]
  end
    
  def self.shape_for_select
    [ ['Форма не указана',  0],
      ['Квадрат',           1],
      ['Прямоугольник',     2],
      ['Трапеция',          3],
      ['Четырехугольник',   4],
      ['Пятиугольник',      5],
      ['Треугольник',       6],
      ['Полигон',           7] ]
  end
    
    

  def actual_status_name
    self.class.get_select_name(:status, self.actual_status_id.to_s.to_i)
  end
  def actual_status_id
    if self.land_use_id == 3
      self.phase > 0 ? self.status_id : 1
    else
      0
    end
  end




end


=begin

  domain_id:integer          номер территории
  sector_id:integer          номер сектора
  land_use_id:integer        категория использования
  phase:integer              очередь ввода

  site_num:string            номер участка (ду)
  cadastral_num:string       кадастровый номер
  num:string                 номер по верстке

  status_id:integer          статус участка
  booked_date:datetime       дата действия брони
  square_meters:string       площадь в кв метрах
  price_for_are:string       цена за сотку 
  price_infra:string         цена за инфраструктуру  
  price:string               цена за участок
  discount:string            скидка/наценка

  land_link_id:integer       связь с парным участком
  distance_to_lake:integer   расстояние до озера

  has_coast:boolean          имеет выход на берег
  has_forest:boolean         участок с лесом
  near_forest:boolean        около леса
  corner_site:boolean        угловой участок
  outside_site:boolean       крайний участок
  has_basement:boolean       есть фундамент
  has_building:boolean       есть здание

  shape_id:integer           форма участка
  altitude:integer           высота на морем
  slope:string               уклон, крутизна
  
  k_interes:integer          число интересов
  k_browsing:integer         число просмотрв
  neighbors:string           id соседних участков
  note:text                  комментарий       


    add_column :homesteads, :coords, :string
    add_column :homesteads, :show_on_map,            :boolean, :default => true
    add_column :homesteads, :show_but_add_compare,   :boolean, :default => true
    add_column :homesteads, :show_but_demonstrate,   :boolean, :default => true
    add_column :homesteads, :show_but_auction,       :boolean, :default => false
    add_column :homesteads, :show_but_booking,       :boolean, :default => true



  site_num:string            участок № 147               (строка будет всегда)              
  booked_date:datetime       в резерве до 23.09.2015           (строки может не быть)       
  square_meters:string       площадь 1200 кв метров      (строка будет всегда)              
  price:string               цена 1 800 000 руб.               (строки может не быть)       
  land_link_id:integer       (есть парный участок)             (строки может не быть)       
  distance_to_lake:integer   путь до озера 380 метров          (строки может не быть)       
  has_coast:boolean          выходит на берег озера            (строки может не быть)       
  has_forest:boolean         участок с лесом                   (строки может не быть)       
  near_forest:boolean        участок около леса                (строки может не быть)       
  corner_site:boolean        угловой участок                   (строки может не быть)       
  outside_site:boolean       крайний участок                   (строки может не быть)       
  has_basement:boolean       есть фундамент для дома           (строки может не быть)       
  has_building:boolean       есть постройки                    (строки может не быть)       
  altitude:integer           высота над уровнем моря 245 м.    (строки может не быть)       
  slope:string               уклон поверхности 9 град.         (строки может не быть)       
  note:text                  комментарий: фраза до 10 слов.    (строки может не быть)       


=end

