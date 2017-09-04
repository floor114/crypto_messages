class Message
  class Destroy < Trailblazer::Operation
    step ::Trailblazer::Operation::Model(::Message, :find)
    step ::Trailblazer::Operation::Policy::Pundit(::MessagePolicy, :deleteable?)
    step ::TrailblazerHelpers::Steps::Destroy
  end
end
