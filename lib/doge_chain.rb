require 'uri'
require 'open-uri'

module DogeApi
  class DogeChain
    def initialize
      @base_uri = 'http://dogechain.info/chain/Dogecoin/q'
    end

    def build_uri(m, params)
      list = params.join '/'
      uri = URI.parse("#{@base_uri}/#{m}/#{list}")
      uri
    end

    def fetch_uri(uri)
      uri.open.read
    end

    def method_missing(m, *args, &block)
      fetch_uri build_uri(m, args)
    end
  end
end
