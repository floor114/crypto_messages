class Message
  class Find < Trailblazer::Operation
    step ::Trailblazer::Operation::Model(::Message, :find_by)
    failure :not_found!

    failure ::TrailblazerHelpers::Steps::AlertsHandler

    def not_found!(options)
      options['error_message'] = I18n.t('message.actions.not_found')
    end
  end
end
