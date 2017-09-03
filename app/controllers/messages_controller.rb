class MessagesController < ApplicationController
  def new
    run Message::Create::Present
    render_view :new
  end
end
