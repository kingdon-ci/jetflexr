require 'pry'

module Coinflex
  # LIVE_API = "https://v2api.coinflex.com"
  # STAGING_API = "https://v2stgapi.coinflex.com"

  def report
    api = Coinflex::RestV2.new(staging: true)

    if api.ping
      api.get_amms
    end
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
