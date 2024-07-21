require 'aws-sdk-translate'
require 'pry'

client = Aws::Translate::Client.new

text = "Hello, this is Bosco Ting, utilizing AWS Tanslate service."

resp = client.translate_text({
  text: text, # required
  source_language_code: "en", # required
  target_language_code: "zh-TW", # required
})
binding.pry