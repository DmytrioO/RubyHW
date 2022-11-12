require './lib/pet'
require 'rack'

use Rack::Reloader, 0
use Rack::Auth::Basic do |username, password|
  username == "admin"
  password == "admin"
end

run Pet.new