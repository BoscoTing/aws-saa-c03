require 'aws-sdk-sqs'

client = Aws::SQS::Client.new

queue_url = "https://sqs.ap-northeast-3.amazonaws.com/660513648685/StandardQueueExample"

resp = client.receive_message({
  queue_url: queue_url, # required
  attribute_names: ["All"], # accepts All, Policy, VisibilityTimeout, MaximumMessageSize, MessageRetentionPeriod, ApproximateNumberOfMessages, ApproximateNumberOfMessagesNotVisible, CreatedTimestamp, LastModifiedTimestamp, QueueArn, ApproximateNumberOfMessagesDelayed, DelaySeconds, ReceiveMessageWaitTimeSeconds, RedrivePolicy, FifoQueue, ContentBasedDeduplication, KmsMasterKeyId, KmsDataKeyReusePeriodSeconds, DeduplicationScope, FifoThroughputLimit, RedriveAllowPolicy, SqsManagedSseEnabled
  message_system_attribute_names: ["All"], # accepts All, SenderId, SentTimestamp, ApproximateReceiveCount, ApproximateFirstReceiveTimestamp, SequenceNumber, MessageDeduplicationId, MessageGroupId, AWSTraceHeader, DeadLetterQueueSourceArn
  message_attribute_names: ["MessageAttributeName"],
  max_number_of_messages: 10,
  visibility_timeout: 1,
  wait_time_seconds: 1,
})

resp.messages.each do |message|
    puts message.receipt_handle
    puts message.body
    puts message.attributes.inspect
    handle = message.receipt_handle

    # Delete message
    resp = client.delete_message({
    queue_url: queue_url, # required
    receipt_handle: handle, # required
    })
end