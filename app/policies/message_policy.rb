class MessagePolicy
  attr_reader :message
  delegate :visits?, :hours?, :visits_left, to: :message

  def initialize(_, message)
    @message = message
  end

  def visit_destroyable?
    visits? && visits_left.zero?
  end

  alias delayed_destroyable? hours?
end
