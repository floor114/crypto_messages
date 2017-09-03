class Message < ApplicationRecord
  DESTROY_TYPES = [
    VISITS = :visits,
    HOURS = :hours
  ].freeze

  enum destroy_type: DESTROY_TYPES
end
