class LotteryService
  def call
    lottery
  end

  private

  def lottery
    users = User.joins(:orders).where(orders: {order_status: :completed,
                                               created_at: Date.today.beginning_of_day - 1.month..Date.today.end_of_day})
    if users.any?
      2.times do
        random_user = users.shuffle.first
        LotteryMailer.win_email(random_user).deliver_later
      end
    end
  end
end