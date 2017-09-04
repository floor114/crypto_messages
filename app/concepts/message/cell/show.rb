class Message
  class Cell
    class Show < Trailblazer::Cell
      include SimpleForm::ActionViewExtensions::FormHelper
      include ActionView::Helpers::DateHelper

      property :body, :visits_left, :destroy_date, :id, :visits?

      def destroy_text
        visits? ? visits_left_text : destroy_date_text
      end

      private

      def visits_left_text
        I18n.t('message.views.destroy_text.visits',
               word: I18n.t('message.views.visits').pluralize(visits_left),
               visits: visits_left)
      end

      def destroy_date_text
        I18n.t('message.views.destroy_text.hours',
               word: distance_of_time_in_words(Time.zone.now, destroy_date))
      end
    end
  end
end
