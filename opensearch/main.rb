# https://opensearch.org/docs/latest/clients/ruby/
require 'opensearch-aws-sigv4'
require 'aws-sigv4'
require 'pry'

signer = Aws::Sigv4::Signer.new(
    service: 'es', 
    region: 'ap-northeast-3',
    access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    )
client = OpenSearch::Aws::Sigv4Client.new({
    host: 'https://search-mydomain-2u5rjiujl7ghw43h3guiwvavni.ap-northeast-3.es.amazonaws.com',
    log: true
}, signer)

# create an index
index = 'prime'

begin
  # Check if the index exists
  if client.indices.exists?(index: index)
    puts "Index '#{index}' already exists."
  else
    # Create an index
    results = client.indices.create(index: index)
    puts "Index created: #{results}"
  end
  binding.pry

  # Create document in index
  results =client.index(index: index, id: '1', body: { name: 'Amazon Echo', 
                                            msrp: '5999', 
                                            year: 2011 })

  # search for the document
  results = client.search(body: { query: { match: { name: 'Echo' } } })
  binding.pry

  # delete the document
  results = client.delete(index: index, id: '1')
  binding.pry

  # delete the index
  results = client.indices.delete(index: index)
  binding.pry
end