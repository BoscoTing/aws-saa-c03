require 'aws-sdk-textract'
require 'pry'

client = Aws::Textract::Client.new region: "ca-central-1"
bucket = "textract-example-bosco-123"
name = "filled_tax_form_example.png"

resp = client.analyze_document({
  document: { # required
    s3_object: {
      bucket: bucket,
      name: name,
    },
  },
  feature_types: ["TABLES"], # required, accepts TABLES, FORMS, QUERIES, SIGNATURES, LAYOUT
})

binding.pry