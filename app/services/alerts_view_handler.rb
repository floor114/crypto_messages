class AlertsViewHandler < BaseService
  def initialize(operation)
    @operation = operation
  end

  def call
    setup_alerts!
    setup_status!
  end

  private

  attr_reader :operation

  def setup_alerts!
    operation['alerts'] = { message_type => message }.with_indifferent_access
  end

  def setup_status!
    operation['status'] = contract_errors_message.blank? ? 200 : 422
  end

  def contract_errors_message
    operation['contract.default'] &&
      @errors ||= operation['contract.default'].errors.full_messages
  end

  def message
    contract_errors_message.blank? ? operation['success_message'] : contract_errors_message
  end

  def message_type
    contract_errors_message.blank? ? 'notice' : 'alert'
  end
end
