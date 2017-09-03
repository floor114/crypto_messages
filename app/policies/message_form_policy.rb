class MessageFormPolicy
  attr_reader :form
  delegate :destroy_type, to: :form

  def initialize(form)
    @form = form
  end

  Message::DESTROY_TYPES.each do |type|
    define_method "#{type}?" do |_|
      type == destroy_type.to_sym
    end
  end
end
