class MessagePolicy
  attr_reader :message
  delegate :visits?, :visits_left, to: :message

  def initialize(_, message)
    @message = message
  end

  def deleteable?
    visits? && visits_left.zero?
  end
end
