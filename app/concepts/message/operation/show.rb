require_dependency 'message/operation/visit'

class Message
  class Show < Trailblazer::Operation
    step ::Trailblazer::Operation::Model(::Message, :find_by)
    failure :not_found!

    success ::Trailblazer::Operation::Nested(::Message::Visit)
    success ::Trailblazer::Operation::Nested(::Message::Destroy)

    failure ::TrailblazerHelpers::Steps::AlertsHandler

    def not_found!(options)
      options['error_message'] = I18n.t('message.actions.not_found')
    end
  end
end
