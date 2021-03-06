activate :autoprefixer do |prefix|
  prefix.browsers = 'last 2 versions'
end

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page '/projects/watchthis/fin.html', layout: 'watchthis/layout'

activate :external_pipeline,
  name: :gulp,
  command: 'gulp',
  source: 'tmp/build'

configure :build do
  activate :gzip
  activate :minify_html
  activate :minify_javascript

  if ENV['ENABLE_IMAGEOPTIM'] == 'true'
    activate :imageoptim do |options|
      options.manifest = true
      options.manifest_path = './'
    end
  end
end

activate :s3_sync do |s3_sync|
  s3_sync.region = 'us-east-1'
end
