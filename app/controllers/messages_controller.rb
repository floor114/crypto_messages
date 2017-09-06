class MessagesController < ApplicationController
  def new
    run Message::Create::Present
    render_view :new
  end

  def create
    run Message::Create do |result|
      return render_json_redirect_response result: result, url: message_path(result['model'])
    end
    render_json_response
  end

  def search
    render_view :search
  end

  def find
    run Message::Find do |result|
      return render_json_redirect_response result: result, url: message_path(result['model'])
    end
    render_json_response
  end

  def show
    run Message::Show do |result|
      return render_view :show, result: result
    end
    redirect_to root_path, result['alerts']
  end
end
