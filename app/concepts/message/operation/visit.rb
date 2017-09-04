class Message
  class Visit < Trailblazer::Operation
    step ::Trailblazer::Operation::Model(::Message, :find)
    step ::Trailblazer::Operation::Policy::Pundit(::MessagePolicy, :visits?)
    step :visit!

    private

    def visit!(_options, model:, **)
      model.decrement!(:visits_left, 1) # rubocop:disable Rails/SkipsModelValidations
    end
  end
end
