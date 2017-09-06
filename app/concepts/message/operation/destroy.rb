class Message
  class Destroy < Trailblazer::Operation
    step ::Trailblazer::Operation::Model(::Message, :find)
    step ::Trailblazer::Operation::Policy::Pundit(::MessagePolicy, :visit_destroyable?)
    step ::TrailblazerHelpers::Steps::Destroy
  end
end
