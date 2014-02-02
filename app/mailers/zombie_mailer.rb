class ZombieMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.zombie_mailer.name_change.subject
  #
  def name_change(zombie)
    @zombie=zombie
    @last_tweet = @zombie.tweets.last
    attachments['z.txt']=File.read("#{Rails.root}/public/robots.txt")

    mail to: @zombie.email, subject: "Your name has changed"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.zombie_mailer.deleted_tweet.subject
  #
  def deleted_tweet
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
