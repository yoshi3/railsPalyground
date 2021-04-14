class HelloController < ActionController::Base
  protect_from_forgery

  @@title = 'Page title'
  @@message = 'A default message';
  def initialize()
  end
  def beforeEachAction
    @title = @@title
    @message = params[:message] || @@message
  end
  def index
    self.beforeEachAction()
    @value = ''
    if request.post? then
      @title = 'A post request'
      @message = "you typed #{params[:input1]}."
      @value = params[:input1]
    end

    if @title == '' || @message == '' then
      redirect_to action: :other, 
      params: { 
        'message': 'from another page'
      }
    end
  end
  def other
    self.beforeEachAction()
  end
end