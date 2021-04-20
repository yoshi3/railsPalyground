class HelloController < ActionController::Base

  def index
    if request.post? then
      @title = 'Result'
      if params[:s1] then
        @message = 'You selected: '
        for value in params[:s1]
          @message += "#{value} "
        end
      else
        @message = 'You have not selected...'
      end
    else
      @title = 'Index'
      @message = 'Select one from below list...'
    end
  end
  
end