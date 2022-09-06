require 'pry'

module Coinflex
  # LIVE_API = "https://v2api.coinflex.com"
  # STAGING_API = "https://v2stgapi.coinflex.com"

  def report
    # cf6_api = Coinflex::RestV2.new(staging: false, slug: 'CF6')
    # cf7_api = Coinflex::RestV2.new(staging: false, slug: 'CF7')

    # if cf6_api.ping
    #   amms = cf6_api.get_amms
    # end
    # if cf7_api.ping
    #   amms2 = cf7_api.get_amms
    # end

    st = true if ENV['CF_API_ENV'] == "staging"
    api = Coinflex::RestV2.new(staging: st, slug: 'SG1')

    if api.ping
      amms = api.get_amms
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
