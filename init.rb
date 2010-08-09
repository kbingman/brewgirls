ROOT_DIR = File.expand_path(File.dirname(__FILE__)) unless defined? ROOT_DIR

require 'rubygems'  
require 'bundler'

Bundler.setup

require 'sinatra/base'
require 'monk/glue'

# require 'ohm'
require 'haml'
require 'sass'   
require 'maruku'

class Main < Monk::Glue
  set :app_file, __FILE__ 
  set :haml, { :format => :html5 }
  use Rack::Session::Cookie
end

# Connect to redis database.
# Ohm.connect(monk_settings(:redis))

# Load all application files.
Dir[root_path('app/**/*.rb')].each do |file|
  require file
end

if defined? Encoding
  Encoding.default_external = Encoding::UTF_8
end

Main.run! if Main.run?
