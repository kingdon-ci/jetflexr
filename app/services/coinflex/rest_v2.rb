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

    def get_accountinfo
      # GET /v2/accountinfo
      response = Excon.get(base + '/v2/accountinfo')
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
      response = Excon.get(base + '/v2/balances')
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
      response = Excon.get(base + '/v2.1/delivery/orders')
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
      response = Excon.get(base + '/v2/AMM')
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
      response = Excon.get(base + '/v2/ping')
      j = nil
      if response.status == 200
        j = JSON.parse(response.body)
      end
      return j&.[]("success")=="true"
    end
  end
end
