require 'mail'

Mail.defaults do
  delivery_method :smtp, address: "mail.mailserver.com", 
                         domain: "mailserver.com",
                         user_name: "user1@mailserver.com",
                         password: "mailserver.com",
                        #  authentication: "plain",
                        #  enable_starttls_auto: true,
                         openssl_verify_mode: "none",
                         enable_ssl: true,
                         port: 587
end

# Mail.deliver do
#   from     'user1@mailserver.com'
#   to       'user2@mailserver.com'
#   subject  'Here is a test email.'
#   body     'This is a test email body!'
# end

mail = Mail.new do
  from     'user1@mailserver.com'
  to       'user2@mailserver.com'
  subject  'Here is a test email.'
  body     'This is a test email body 9999888888888!'
end

sent_result = mail.deliver
puts sent_result