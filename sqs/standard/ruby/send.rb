require 'aws-sdk-sqs'
require 'pry'

client = Aws::SQS::Client.new
queue_url = "https://sqs.ap-northeast-3.amazonaws.com/660513648685/StandardQueueExample"

resp = client.send_message({
  queue_url: queue_url, # required
  message_body: "Hello Ruby!", # required
  delay_seconds: 1,
  message_attributes: {
    "Fruit" => {
      string_value: "Apple",
      data_type: "String",
    },
  },
})