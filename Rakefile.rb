# Build and deploy script from Dave Konopka:
# http://www.davekonopka.com/2013/middleman-deploy.html

namespace :site do
  desc 'Middleman build'
  task :build do
    puts 'Building site...'
    puts `bundle exec middleman build --verbose`
  end

  desc 'Build, deploy, bust cache'
  task deploy: ['site:build', 's3:deploy']
end

namespace :s3 do
  require 'dotenv/tasks'

  desc 'Deploy build to S3'
  task deploy: :dotenv do
    require 'aws-sdk'

    Dotenv.load
    bucket_name = ENV['AWS_BUCKET']

    s3 = Aws::S3::Resource.new
    bucket = s3.bucket(bucket_name)

    puts 'Deleting current site files...'
    bucket.objects.batch_delete!

    puts 'Uploading site files...'
    Dir.glob('build/**/*.*').each do |file_name|
      key = file_name.gsub('build/', '')
      puts "Uploading file #{file_name} to bucket #{bucket_name}."
      # bucket.objects[key].write(file: file_name)
      bucket.object(key).upload_file(file_name)
    end
  end
end
