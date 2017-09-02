module Layout
  module Cell
    class Application < Trailblazer::Cell
      include ::ActionView::Helpers::CsrfHelper
    end
  end
end
