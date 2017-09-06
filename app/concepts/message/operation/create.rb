require_dependency 'message/operation/delayed_destroy'

class Message
  class Create < Trailblazer::Operation
    class Present < Trailblazer::Operation
      extend ::Trailblazer::Operation::Contract::DSL

      contract ::Message::Contract::Create

      step ::Trailblazer::Operation::Model(::Message, :new)
      step ::Trailblazer::Operation::Contract::Build()
    end

    step ::Trailblazer::Operation::Nested(::Message::Create::Present)

    step ::Trailblazer::Operation::Contract::Validate(key: :message)
    failure ::TrailblazerHelpers::Steps::AlertsHandler

    step :setup_success_message!

    step ::Trailblazer::Operation::Contract::Persist()
    success :delayed_destroy!

    success ::TrailblazerHelpers::Steps::AlertsHandler

    private

    def delayed_destroy!(_options, model:, **)
      ::Message::DelayedDestroy.call(id: model.id)
    end

    def setup_success_message!(options, **)
      options['success_message'] = I18n.t('message.actions.created')
    end
  end
end
