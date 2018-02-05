require 'digest/sha2'
class UserMailer < ApplicationMailer
  default "Message-ID"=>"#{Digest::SHA2.hexdigest(Time.now.to_i.to_s)}@isott2018.com"
  default from: 'isott2018@isott2018.com'

  def registration_email(r)
    @resgitration = r
    @url = 'http://isott2018.com'
    #mail(to: JSON.parse(@registration.content)[:custom][:email], subject: 'Registration successed')
    mail(to: r, subject: 'Registration successed')
  end
  
end
