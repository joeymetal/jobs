class Contact < MailForm::Base
  attribute :nome,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :mensagem
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "My Contact Form",
      :to => "joelcio_ms@hotmail.com",
      :from => %("#{nome}" <#{email}>)
    }
  end
end
