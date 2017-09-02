class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def render_view(action, options = {})
    render html: cell(cell_class(action), options.fetch(:model, @model),
                      layout: options.fetch(:layout, ::Layout::Cell::Application),
                      context: options.except(:layout, :model))
  end

  private

  def cell_class(action)
    "#{controller_name.classify}::Cell::#{action.to_s.classify}".constantize
  end
end
