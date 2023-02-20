class LotteryMailerPreview < ActionMailer::Preview

  def win_email
    LotteryMailer.win_email(User.first)
  end

end