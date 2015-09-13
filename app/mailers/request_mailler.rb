class RequestMailler < ActionMailer::Base
  default from: "order@lubikry.ru"
  
  def site_request_post(post_query)
    @post_query = post_query
    @url  = 'http://www.lubikry.ru'
    mail(to: 'wellcome@lubikry.ru', subject: 'Письмо с сайта from Любимый Край')
  end
  # pubus@classy.ru
 
 
  
end
#  RequestMailler.site_request_post(@user).deliver_later