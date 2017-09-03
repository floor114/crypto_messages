class Message
  class Contract
    class Create < Reform::Form
      include ::ActionView::Helpers::TextHelper

      delegate :visits?, :hours?, to: :message_form_policy

      DEFAULT_DURATION = 86_400
      DEFAULT_VISITS = 1

      property :ecnrypted_body, virtual: true, populator: :body_populator!
      property :destroy_type, populator: :destroy_type_populator!
      properties :body, :destroy_date
      property :visits_left, default: DEFAULT_VISITS,
                             skip_if: :hours?,
                             populator: :visits_left_populator!
      property :destroy_duration, virtual: true,
                                  default: DEFAULT_DURATION,
                                  skip_if: :visits?,
                                  populator: :destroy_date_populator!

      validates :body, :destroy_type, presence: true
      validates :destroy_type, inclusion: { in: Message::DESTROY_TYPES }
      validates :visits_left, numericality: { greater_or_equal_than: DEFAULT_VISITS,
                                              only_integer: true }
      validates :destroy_duration, numericality: { greater_or_equal_than: DEFAULT_DURATION,
                                                   only_integer: true }

      private

      def body_populator!(fragment:, **)
        self.body = fragment.present? ? fragment : nil
      end

      def visits_left_populator!(fragment:, **)
        self.visits_left = fragment.present? ? fragment.to_i + 1 : nil
      end

      def destroy_date_populator!(fragment:, **)
        self.destroy_date = fragment.present? ? Time.zone.now + fragment.to_i : nil
      end

      def destroy_type_populator!(fragment:, **)
        self.destroy_type = fragment.present? ? fragment.to_sym : nil
      end

      def message_form_policy
        @message_form_policy ||= MessageFormPolicy.new(self)
      end
    end
  end
end
