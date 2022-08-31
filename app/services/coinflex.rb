require 'pry'

module Coinflex
  LIVE_API = "https://v2api.coinflex.com"
  STAGING_API = "https://v2stgapi.coinflex.com"

  module_function :report
  def report
    binding.pry
  end
end

require './app/services/coinflex/amms'
require './app/services/coinflex/deliveries'
require './app/services/coinflex/margins'
require './app/services/coinflex/perps'
# require './coinflex/red_button'
# require './coinflex/tax8949'

# Coinflex.report
