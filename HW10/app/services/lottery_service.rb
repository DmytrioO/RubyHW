class LotteryService
  last_month_orders_ids = Order.completed.where(["created_at >= ? AND created_at <= ?",
                                             Date.today.beginning_of_day - 1.month, Date.today.end_of_day]).ids.shuffle
  if last_month_orders_ids.any?
    random_id = rand(last_month_orders_ids.count)
    rand_order_first = Order.find(last_month_orders_ids[random_id])
    random_id = rand(last_month_orders_ids.count)
    rand_order_second = Order.find(last_month_orders_ids[random_id])
    LotteryMailer.win_email(rand_order_first.user).deliver_now
    LotteryMailer.win_email(rand_order_second.user).deliver_now
  end
end