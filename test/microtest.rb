require 'rubygems'
require 'bundler'

Bundler.require

require './app/services/coinflex/amms'

amm = Coinflex::AMMs.new


# amm.list

require './app/services/coinflex'

Coinflex.report
