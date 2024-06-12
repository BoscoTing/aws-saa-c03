require 'aws-sdk-s3'
require 'pry'
require 'securerandom'

bucket_name = ENV['BUCKET_NAME']
region = "ap-northeast-3"

client = Aws::S3::Client.new # Creating a new instance of the AWS SDK for Ruby.

resp = client.create_bucket({ 
    bucket: bucket_name, 
    create_bucket_configuration: {
        location_constraint: region, 
  }, 
})
# binding.pry # After executing the code, the console will ask you to enter what you want to check. E.g. "resp.bucket"

number_of_files = 1 + rand(6) # Generate a random number between 1 and 6
puts "number_of_files: #{number_of_files}"

number_of_files.times.each do |i|
    puts "i: #{i}" # Print the current iteration
    filename = "file_#{i}.txt"
    output_path = "/tmp/#{filename}"

    File.open(output_path, "w") do |f|
        f.write(SecureRandom.uuid) # Generate a random UUID
    end

    File.open(output_path, 'rb') do |f|
        client.put_object(
            bucket: bucket_name, 
            key: filename,  
            body: f
        )
    end
end