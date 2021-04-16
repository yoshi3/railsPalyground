class HelloController < ActionController::Base
  before_action :beforeEachAction
  protect_from_forgery

  @@title = 'Which do u like?'
  @@message = 'Plz select ur one'
  @@select_items = ['apples', 'bananas', 'oranges']

  def beforeEachAction
    @title = @@title
    @message = @@message
    @select_items = @@select_items
    @selected = params[:selected] || '';
    @reason = params[:reason] || '';
  end
  def index
    if request.post? then
      @message = "Yay! Ur selected are #{@selected}!" || @@message
    end
  end
  def other
  end
end