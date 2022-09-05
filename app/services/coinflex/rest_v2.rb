require 'uri'
require './app/services/coinflex/abstract_rest'

module Coinflex

  class RestV2 < AbstractRest

    LIVE_API = "https://v2api.coinflex.com/v2"
    STAGING_API = "https://v2stgapi.coinflex.com"

    def initialize(staging: )
      if staging
        @base = STAGING_API
      else
        @base = LIVE_API
      end
    end

    def hostname
      URI.parse(base).hostname
    end

    def get_accountinfo
      # GET /v2/accountinfo
      response = request('GET', hostname, '/v2/accountinfo', nil, priv: true)
      j = nil
      if response.status == 200
        binding.pry
      else
        binding.pry
      end
      return j&.[]("data")
    end

    def get_balances
      # GET /v2/balances (/?instrumentId)
      response = request('GET', hostname, '/v2/balances', nil, priv: true)
      j = nil
      if response.status == 200
        binding.pry
      else
        binding.pry
      end
      return j&.[]("data")
    end

    def get_positions
      # GET /v2/positions (/?instrumentId)
    end

    def get_orders
      # GET /v2/orders
      # GET /v2.1/orders (...)
    end

    def get_delivery_orders
      # GET /v2.1/delivery/orders (...)
      response = request('GET', hostname, '/v2/delivery/orders', nil, priv: true)
      j = nil
      if response.status == 200
        binding.pry
      else
        binding.pry
      end
      return j&.[]("data")
    end

    def get_funding_payments
      # GET /v2/funding-payments
    end

    def get_amms
      # GET /v2/AMM
      response = request('GET', hostname, '/v2/AMM', nil, priv: true)
      j = nil
      if response.status == 200
        binding.pry
      else
        binding.pry
      end
      return j&.[]("data")
    end

    def ping
      # GET /v2/ping
      response = request('GET', hostname, '/v2/ping', nil)
      j = nil
      if response.status == 200
        j = JSON.parse(response.body)
      end
      return j&.[]("success")=="true"
    end
  end
end
