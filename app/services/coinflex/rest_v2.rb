module Coinflex

  class RestV2

    LIVE_API = "https://v2api.coinflex.com/v2"
    STAGING_API = "https://v2stgapi.coinflex.com"

    def get_accountinfo
      # GET /v2/accountinfo
    end

    def get_balances
      # GET /v2/balances (/?instrumentId)
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
    end

    def get_funding_payments
      # GET /v2/funding-payments
    end

    def get_amms
      # GET /v2/AMM
    end

    def ping
      binding.pry
      # GET /v2/ping
    end
  end
end
