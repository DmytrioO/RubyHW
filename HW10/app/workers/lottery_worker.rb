require 'sidekiq-scheduler'

class LotteryWorker
  include Sidekiq::Worker

  def perform
    LotteryService.new
  end
end