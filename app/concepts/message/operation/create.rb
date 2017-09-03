class Message::Create < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(Message, :new)
    step Contract::Build(constant: Message::Contract::Create)
  end
end
