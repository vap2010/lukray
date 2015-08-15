class CreateHomesteads < ActiveRecord::Migration
  def change
    create_table :homesteads do |t|
      t.integer :domain_id
      t.integer :sector_id
      t.integer :land_use_id, :default => 1
      t.integer :phase

      t.string :site_num
      t.string :cadastral_num
      t.string :num

      t.integer :status_id, :default => 1
      t.datetime :booked_date
      t.string :square_meters
      t.string :price_for_are
      t.string :price_infra
      t.string :price
      t.string :discount, :default => '0'

      t.integer :land_link_id
      t.integer :distance_to_lake

      t.boolean :has_coast, :default => false
      t.boolean :has_forest, :default => false
      t.boolean :near_forest, :default => false
      t.boolean :corner_site, :default => false
      t.boolean :outside_site, :default => false
      t.boolean :has_basement, :default => false
      t.boolean :has_building, :default => false

      t.integer :shape_id
      t.integer :altitude
      t.string  :slope

      t.integer :k_interes, :default => 0
      t.integer :k_browsing, :default => 0
      t.string :neighbors
      t.text :note

      t.timestamps
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
  
bundle exec rails  g  scaffold  'homestead'  domain_id:integer  land_use_id:integer  site_num:string  cadastral_num:string  phase:integer  status_id:integer  acreage_s:string  price:string  discount:string  has_coast:boolean  has_forest:boolean  corner_site:boolean  outside_site:boolean  land_link_id:integer  shape_id:integer  slope:string  altitude:integer  k_interes:integer  k_browsing:integer  neighbors:integer  note:text  -p 


=end
