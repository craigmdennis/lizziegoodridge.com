###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Directories
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Language Support
set :haml, { :ugly => true, :format => :html5 }
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

# Turn on syntax highlighting
activate :rouge_syntax

# Build-specific configuration
configure :build do

  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

# Add bower components after asset hashing
after_configuration do
  sprockets.append_path File.join root.to_s, "vendor/assets/components"
end

# Deploy to github
activate :deploy do |deploy|
  deploy.method = :git
  deploy.build_before = true
  deploy.commit_message = 'New version deployed at `timestamp`'
end

# Currently hosted:
# http://cdn.simplebitdesign.com/contact_me.php
# after_build do |builder|
#   src = File.join(config[:source],"contact_me.php")
#   dst = File.join(config[:build_dir],"contact_me.php")
#   builder.source_paths << File.dirname(__FILE__)
#   builder.copy_file(src,dst)
# end
