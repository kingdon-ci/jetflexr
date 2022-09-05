require 'pry'

module Coinflex
  LIVE_API = "https://v2api.coinflex.com"
  STAGING_API = "https://v2stgapi.coinflex.com"

  def report
    binding.pry
  end
  module_function :report
end

require './app/services/coinflex/rest_v2.rb'
require './app/services/coinflex/rest_v3.rb'

require './app/services/coinflex/amms'
require './app/services/coinflex/deliveries'
require './app/services/coinflex/margins'
require './app/services/coinflex/perps'
# require './coinflex/red_button'
# require './coinflex/tax8949'

# Coinflex.report
