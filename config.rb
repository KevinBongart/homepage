activate :autoprefixer do |prefix|
  prefix.browsers = 'last 2 versions'
end

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

activate :external_pipeline,
  name: :gulp,
  command: 'gulp',
  source: 'tmp/build'

configure :build do
  activate :gzip
  activate :imageoptim
  activate :minify_html
  activate :minify_javascript
end

activate :s3_sync do |s3_sync|
  s3_sync.region = 'us-east-1'
end
