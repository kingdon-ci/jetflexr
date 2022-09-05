require 'openssl'
require 'Base64'

require './app/services/coinflex/hmac'

module Coinflex
  class AbstractRest
    include Coinflex::HMAC
    # Sub-class should override both
    LIVE_API = "abstract"
    STAGING_API = "abstract"

    attr_reader :base

    #Sub-class should implement initialize like this:
    # def initialize(staging: )
    #   if staging
    #     @base = STAGING_API
    #   else
    #     @base = LIVE_API
    #   end
    # end

    def request(verb, path, method, body, priv:false)
      if verb == "GET" && !priv
        Excon.get(base + method)
      elsif verb == "GET" && priv
        head = header(nonce, verb, path, method, body)
        Excon.get(base + method, headers: head)
      end
    end

    def nonce
      (Time.now.to_f * 1000).to_i.to_s
    end
  end
end
