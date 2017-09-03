module RenderHelper
  def render_view(action, options = {})
    fetch_operation_result!(options)
    render_now_flashes!(options.fetch(:flashes, operation_flashes))
    render html: cell(cell_class(action), options.fetch(:model, @form || @model),
                      layout: options.fetch(:layout, ::Layout::Cell::Application),
                      context: options.except(:layout, :model, :result))
  end

  def render_json_response(options = {})
    fetch_operation_result!(options)
    render json: operation_flashes.merge(options.except(:result)), status: op_result['status']
  end

  def render_json_redirect_response(options = {})
    fetch_operation_result!(options)
    render_flashes!(options.fetch(:flashes, operation_flashes))
    render json: operation_flashes.merge(options.except(:result)), status: op_result['status']
  end

  private

  attr_reader :op_result

  def render_now_flashes!(flashes)
    flash.now.alert = flashes[:alert] if flashes[:alert]
    flash.now.notice = flashes[:notice] if flashes[:notice]
  end

  def render_flashes!(flashes)
    flash.alert = flashes[:alert] if flashes[:alert]
    flash.notice = flashes[:notice] if flashes[:notice]
  end

  def fetch_operation_result!(options)
    @op_result = options.fetch(:result, result)
  end

  def operation_flashes
    (op_result && op_result['alerts']) || {}
  end

  def cell_class(action)
    "#{controller_name.classify}::Cell::#{action.to_s.classify}".constantize
  end
end
