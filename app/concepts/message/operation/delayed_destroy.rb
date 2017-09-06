class Message
  class DelayedDestroy < Trailblazer::Operation
    step ::Trailblazer::Operation::Model(::Message, :find)
    step ::Trailblazer::Operation::Policy::Pundit(::MessagePolicy, :delayed_destroyable?)
    step ::TrailblazerHelpers::Steps::DelayedDestroy
  end
end
