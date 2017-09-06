class MessageDestroyWorker
  include Sidekiq::Worker

  def perform(id)
    Message.find_by(id: id)&.destroy
  end
end
