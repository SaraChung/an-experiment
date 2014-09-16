class Contact < ActiveRecord::Base
	include MailForm::Delivery

  append :remote_ip, :user_agent, :session
  # attributes :name, :email, :message, :created_at, :nickname
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname,  :captcha  => true

  def headers
    {
      :subject => "Contact me!",
      :to => "rrrrrah@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
