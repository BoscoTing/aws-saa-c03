require 'aws-sdk-comprehend'
require 'pry'

client = Aws::Comprehend::Client.new
# text = "Hello World! This is Bosco Ting, doing a test with Comprehend."
negative_text = "Hello World! This is Bosco Ting, doing a awful test with Comprehend I hate this service!"

resp = client.detect_sentiment({ 
    language_code: "en", 
    text: negative_text 
})

puts resp.sentiment