class LotteryMailer < ApplicationMailer
  default from: 'from@example.com'

  def win_email(user)
    @user = user
    mail(to: @user.email, subject: 'Congratulations!!!')
  end
end
