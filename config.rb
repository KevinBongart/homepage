activate :autoprefixer do |prefix|
  prefix.browsers = 'last 2 versions'
end

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

configure :build do
  activate :minify_javascript
end

activate :external_pipeline,
  name: :gulp,
  command: 'gulp',
  source: 'tmp/build'

activate :gzip
activate :imageoptim
activate :minify_html
