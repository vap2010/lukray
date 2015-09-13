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
  subpages = {'about' => ['Особенности и достоинства', 'Дома и строительство', 'Правила нашего поселка'],
              'plan'  => ['Общая схема территории', 'Большой участок у озера', 'Маленький лесной участок', 'Участок  на опушке леса'],
              'place' => ['От Москвы до юга области', 'Местечко к югу от Пущино',  'От Тулы до Оки', 'Как проехать от Москвы', 'Как проехать от Тулы'] ,
              'infro' => ['Планы развития поселка'],
              'nature' => ['Характер местности и ландшафты', 'Среднерусская возвышенность', 'Достопримечательности', 'Климат и погода', 'Флора и Фауна', 'Рыбалка и охота'],
              'around' => ['Поселки и деревни', 'Фермы и колхозы', 'Конюшни', 'Аэродромы', 'Спорт и фитнес', 'Аптеки и больницы', 'Рестораны, кафе и клубы', 'Музеи, Кинотеатры']
             }  
  text = 'Продажа земельных участков под застройку в коттеджном поселке'
  aliases = Page.top_menu_aliases
  ii = 0 
  ['Главная', 'О поселке', 'План поселка', 'Местоположение', 'Инфраструктура', 'Природа', 'Окрестности',
   'Цены', 'Контакты', 'Фотогалерея', 'Условия покупки', 'Услуги покупателям'].each do |title|
   ii += 1
   page = Page.create({ position: ii*10, alias: aliases[ii-1], is_shown_in_menu: true, is_published: (ii<10),
                        title: title, menu_title: title, announce: text, body: text, is_preview_published: false })
    subpgs = subpages[page.alias]             
    if subpgs
      pos = 1
      subpgs.each do |spg|
        p = page.children.create({ position: pos, alias: page.alias + pos.to_s, is_shown_in_menu: true, is_published: true, 
                                   title: spg, menu_title: spg, announce: spg, body: spg, is_preview_published: false })
        p.save        
        pos += 1
      end
    end
  end 
  puts 'Pages OK'
  
end

  
#Add homesteads
if Homestead.count == 0
  puts 'Homesteads OK' if Seeds::LoadHomesteadsTable.load_homesteads  
end

if Category.count == 0
  Category.create({ position: 1, type_id: 1, title: 'Микрорайон 1 - Большой участок у озера'  })
  Category.create({ position: 2, type_id: 1, title: 'Микрорайон 2 - Небольшой лесной участок' })
  Category.create({ position: 3, type_id: 1, title: 'Микрорайон 3 - Участок на опушке леса'   })
  
  Category.create({ position: 1, type_id: 2, title: 'Шаблон регулярной страницы с высоким визуалом' })
  Category.create({ position: 2, type_id: 2, title: 'Шаблон регулярной страницы с низким визуалом'  })
  
  Category.create({ position: 1, type_id: 3, title: 'Рекламные материалы' })
  Category.create({ position: 2, type_id: 3, title: 'Лицензии и сертификаты' })
  Category.create({ position: 3, type_id: 3, title: 'Договора и приложения' })
  Category.create({ position: 4, type_id: 3, title: 'Кадастровые документы' })
  Category.create({ position: 5, type_id: 3, title: 'Другие документы' })
  
  Category.create({ position: 1, type_id: 4, title: 'Новости поселка' })
  Category.create({ position: 2, type_id: 4, title: 'Что происходит в округе' })
  
  Category.create({ position: 1, type_id: 5, title: 'Фотогалерея - Ферма' })
  Category.create({ position: 2, type_id: 5, title: 'Фотогалерея - Природа'  })
  Category.create({ position: 3, type_id: 5, title: 'Фотогалерея - Окрестности' })
  Category.create({ position: 4, type_id: 5, title: 'Фотогалерея - Времена года' })
  Category.create({ position: 5, type_id: 5, title: 'Фотогалерея - Ведутся работы' })
  Category.create({ position: 6, type_id: 5, title: 'Фотогалерея - Будущее поселка' })
  
  Category.create({ position: 1, type_id: 6, title: 'Баннеры - в шахматку на входную' })
  Category.create({ position: 2, type_id: 6, title: 'Баннеры - на входную под визуал' })
  Category.create({ position: 3, type_id: 6, title: 'Баннеры - для внутренних страниц'})
  
  Category.create({ position: 1, type_id: 7, title: 'Запрос - вопрос с сайта'})
  Category.create({ position: 2, type_id: 7, title: 'Запрос - обратный звонок'})
  Category.create({ position: 3, type_id: 7, title: 'Запрос - консультацию по подбору'})
  Category.create({ position: 4, type_id: 7, title: 'Запрос - на просмотр участков'})
  Category.create({ position: 5, type_id: 7, title: 'Запрос - бронирование участка'})
  Category.create({ position: 6, type_id: 7, title: 'Запрос - деловое предложение'})
  Category.create({ position: 7, type_id: 7, title: 'Запрос - на статус ВНС'})
  Category.create({ position: 8, type_id: 7, title: 'Запрос - рекомендация клиента'})

  puts 'Categories OK' 
end




=begin
 - территории поселка (1, 2, 3)
 - скины страниц,
 - категории документов,
 - категории новостей,
 - список фотогалерей
 - категории баннеров
 - категории запросов с сайта. 

- на просмотр участков, 
- на консультацию по подбору, 
- на обратный звонок, 
- заявка на бронирование, 
- вопрос с сайта,
- рекомендация клиента,
- заявка на статус "внс"
- деловое предложение,

      Фотогалерея 
            Природа
            Окрестности 
            Ферма 
            Будущее поселка  
            Ведутся работы 

      Условия покупки
            Документация
=end

