require 'bunny'

connection_string = \
    "amqps://admin:your_password_here@b-e4c6acfb-034c-4351-a98d-b579586eeccb.mq.ap-northeast-3.amazonaws.com:5671"
connection = Bunny.new(connection_string)
connection.start
channel = connection.create_channel
queue = channel.queue('hello')
begin
  queue.subscribe(block: true) do |_delivery_info, _properties, body|
    puts body
  end
rescue => e
    puts e.inspect
    channel.close
    connection.close
    exit(0)
end