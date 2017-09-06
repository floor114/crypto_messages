require_dependency 'message/operation/visit'

class Message
  class Show < Trailblazer::Operation
    step ::Trailblazer::Operation::Nested(::Message::Find)

    success ::Trailblazer::Operation::Nested(::Message::Visit)
    success ::Trailblazer::Operation::Nested(::Message::Destroy)
  end
end
