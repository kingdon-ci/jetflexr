module Coinflex
  class AbstractRest
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
  end
end
