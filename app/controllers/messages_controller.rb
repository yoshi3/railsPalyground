class MessagesController < ApplicationController
  def index
    @message = 'Message datas.'
    @data = Message.all
  end
  def show
    @message = 'Indexed data.'
    @data = Message.find params[:id]
  end
  def add
    @message = 'Add a message data.'
    @data = Message.new
  end
  def create
    @data = Message.new message_params
    if @data.save then
      redirect_to '/messages'
    else
      render 'add'
    end
  end
  def edit
    @message = "Edit data.[id = #{params[:id]}]"
    @data = Message.find params[:id]
  end
  def update
    object = Message.find params[:id]
    object.update(message_params)
    if params.has_key? :from
      redirect_to "/messages/#{object.id}"
    else
      redirect_to '/messages'
    end
  end
  def delete
    object = Message.find(params[:id])
    object.destroy
    redirect_to '/messages'
  end

  private
  def message_params
    params.require(:message).permit(:person_id, :title, :message, :image)
  end
end
