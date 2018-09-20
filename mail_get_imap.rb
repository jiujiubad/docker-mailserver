require 'mail'

Mail.defaults do
  retriever_method :imap, address: "mailserver.com",
                          user_name: 'user2@mailserver.com',
                          password: 'mailserver.com',
                          port: 993,
                          enable_ssl: true
end

email_list = Mail.all

puts email_list
