class InstaMailer < ApplicationMailer
  def insta_mailer(posting_user)
    @posting_user = posting_user
    mail to: @posting_user.user.email, subject: '写真を投稿しました！'
  end
end
