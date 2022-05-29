class TestEmailForm < MailForm::Base
  attribute :fullname, validate: true
  attribute :email, validate: /\A[^@\s]+@[^@\s]+\z/i
  attribute :phonenumber


  attribute :message
  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      subject: "My Contact Form",
      to: "ttatsianatt@gmail.com",
      from: %("#{fullname}" <#{email}>)
    }
  end
end
