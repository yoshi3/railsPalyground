class MessageBoardController < ActionController::Base
  layout 'message_board'

  def initialize()
    super
    begin
      @message_data = JSON.parse(File.read('data.txt'))
    rescue => exception
      @message_data = Hash.new
    end
    @message_data.each do |key, object|
      if Time.now.to_i - key.to_i > 24*60*60 then
        @message_data.delete(key)
      end
      File.write('data.txt', @message_data.to_json)
    end
  end
  def index
    if request.post? then
      object = MyData.new(params['message'], params['name'], params['mail'])
      @message_data[Time.now.to_i] = object
      data = @message_data.to_json
      File.write('data.txt', data)
      @message_data = JSON.parse(data)
    end
  end
end

class MyData
  attr_accessor :name
  attr_accessor :mail
  attr_accessor :message

  def initialize message, name, mail
    self.name =  name
    self.mail = mail
    self.message = message
  end
end
