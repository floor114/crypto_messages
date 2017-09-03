class Layout
  class Cell
    class Application < Trailblazer::Cell
      include ::ActionView::Helpers::CsrfHelper

      delegate :controller_name, to: :controller

      def action_assets_path(type)
        path = "#{[params[:controller], params[:action]].join('/')}.#{type}"
        ::Rails.application.assets.find_asset(path) ? path : ''
      end

      def general_assets_path(type)
        path = "#{params[:controller]&.split('/')&.first}.#{type}"
        ::Rails.application.assets.find_asset(path) ? path : ''
      end
    end
  end
end
