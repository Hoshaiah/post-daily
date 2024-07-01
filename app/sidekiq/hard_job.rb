class HardJob
  include Sidekiq::Job

  def perform(test)
    puts test
  end
end
