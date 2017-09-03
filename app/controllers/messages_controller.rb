class MessagesController < ApplicationController
  def new
    run Message::Create::Present
    render_view :new
  end

  def create
    run Message::Create do |result|
      return render_json_redirect_response result: result, url: root_path
    end
    render_json_response
  end
end
