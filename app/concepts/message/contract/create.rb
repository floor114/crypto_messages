module Message::Contract
  class Create < Reform::Form
    DEFAULT_DURATION = 86_400
    DEFAULT_VISITS = 1

    property :destroy_duration, virtual: true, default: DEFAULT_DURATION
    property :show_password, virtual: true
    property :visits_left, default: DEFAULT_VISITS
    property :destroy_date
    properties :body, :destroy_type

    validates :body, :destroy_type, presence: true
    validates :visits_left, numericality: { greater_or_equal_than: 0, only_integer: true }
  end
end
