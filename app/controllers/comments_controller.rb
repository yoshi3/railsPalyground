class CommentsController < ActionController::Base
  def index
    @message = 'Comment datas.'
    @data = Comment.all
  end
  def show
    @message = 'Indexed data.'
    @data = Comment.find params[:id]
  end
  def add
    @message = 'Add a comment data.'
    @data = Comment.new
    @data.message_id = params[:message_id] || nil
  end
  def create
    @data = Comment.new comment_params
    if @data.save then
      redirect_to "/messages/#{@data.message_id}"
    else
      render 'add'
    end
  end
  def edit
    @message = "Edit data.[id = #{params[:id]}]"
    @data = Comment.find params[:id] 
  end
  def update
    object = Comment.find params[:id]
    object.update(comment_params)
    redirect_to "/messages/#{object.message_id}"
  end
  def delete
    object = Comment.find(params[:id])
    object.destroy
    redirect_to "/messages/#{object.message_id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:person_id, :message_id, :comment)
  end
end
