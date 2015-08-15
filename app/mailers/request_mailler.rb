class RequestMailler < ActionMailer::Base
  default from: "in@freedomhill.ru"
  
  def site_request_post(post_query)
    @post_query = post_query
    @url  = 'http://www.freedomhill.ru'
    mail(to: 'qualification@classy.ru', subject: 'Mail from Site')
  end
  # pubus@classy.ru
 
 
  
end
#  RequestMailler.site_request_post(@user).deliver_later