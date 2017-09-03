class Message
  class Cell
    class New < Trailblazer::Cell
      include ActionView::Helpers::FormOptionsHelper
      include SimpleForm::ActionViewExtensions::FormHelper
    end
  end
end
