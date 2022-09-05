require './app/services/coinflex/abstract_rest'
module Coinflex

  class RestV3 < AbstractRest

    LIVE_API = "https://v2api.coinflex.com"
    STAGING_API = "https://v2stgapi.coinflex.com"

    def initialize(staging: )
      if staging
        @base = STAGING_API
      else
        @base = LIVE_API
      end
    end

    def get_main_account
      # GET /v3/account
    end

    def get_sub_account(sub_account_name)
      # GET /v3/account ? subAcc
    end

    def get_balances
      # GET /v3/balances ? subAcc
    end

    def get_deposit_addresses
      # GET /v3/deposit-addresses ? !asset !network
    end

    def get_orders
      # GET /v3/orders
    end

    def get_trades
      # GET /v3/trades
    end

    def get_amms
      # GET /v3/AMM ? !hashToken ...
    end

    def get_amm_positions
      # GET /v3/AMM/positions ? !hashToken ...
    end

    def get_amm_orders
      # GET /v3/AMM/orders ? !hashToken ...
    end

    def get_amm_trades
      # GET /v3/AMM/trades ? !hashToken ...
    end

    def get_amm_hash_tokens
      # GET /v3/AMM/hash-token
    end

    def get_delivery_working
      # GET /v3/delivery/working
    end
  end
end
