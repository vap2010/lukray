# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



#Add roles
if Role.count == 0
  client     = Role.create({ name: 'Клиент',     alias: 'client',     weight: 10 })
  moderator  = Role.create({ name: 'Модератор',  alias: 'moderator',  weight: 22 })
  manager    = Role.create({ name: 'Менеджер',   alias: 'manager',    weight: 30 })
  superadmin = Role.create({ name: 'Суперадмин', alias: 'superadmin', weight: 50 })
  puts 'Roles OK'
end

#Add user admin
if User.count == 0
  User.where(phone: '8 925 585-61-39', role_id: Role.where(alias: 'superadmin').first, name: 'Вадим', surname: 'superadmin', email: 'vadim-ip@mail.ru', type_id: 1, status_id: 0).first_or_create(password: '123vap123')
  User.where(phone: '----------', role_id: Role.where(alias: 'moderator').first, name: 'Модератор', surname: 'moderator', email: 'pubus@classy.ru', type_id: 1, status_id: 0).first_or_create(password: '123vap123')
  User.where(phone: '-------', role_id: Role.where(alias: 'client').first, name: 'Клиент', surname: 'client', email: 'c-master@classy.ru', type_id: 1, status_id: 0).first_or_create(password: '123vap123')
  puts 'Users OK'
end

#Add pages
if Page.count == 0
  text = 'Продажа земельных участков под застройку в коттеджном поселке'
  aliases = ['main', 'about', 'plan', 'place', 'infro', 'nature', 'around',
             'price', 'contact', 'photo', 'sale', 'services']
  ii = 0 
  ['Главная', 'О поселке', 'План поселка', 'Местоположение', 'Инфраструктура', 'Природа','Окрестности',
   'Цены', 'Контакты', 'Фотогалерея', 'Условия покупки', 'Услуги покупателям'].each do |title|
   ii += 1
   Page.create({ position: ii*10, alias: aliases[ii], is_shown_in_menu: true, 
                 title: title, menu_title: title, announce: text, body: text,
                 is_published: (ii < 9) })
  end 
  puts 'Pages OK'
end



