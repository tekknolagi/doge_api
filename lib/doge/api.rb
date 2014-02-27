require 'uri'
require 'open-uri'

module DogeApi
  class DogeApi
    attr_accessor :api_key

    def initialize(api_key, version=1)
      @api_key = api_key
      @api_version = version
      @base_uri = URI.parse(_get_dogeapi_endpoint)
    end

    def build_uri(m, args)
      uri = @base_uri
      params = args.merge(:a => m, :api_key => @api_key)
      uri.query = URI.encode_www_form(params)
      uri
    end

    def fetch_uri(uri)
      uri.open.read
    end

    def method_missing(m, args = {}, &block)
      fetch_uri build_uri(m, args)
    end

    private

    def _get_dogeapi_endpoint()
      base_uri = 'https://www.dogeapi.com/wow'
      base_uri += '/v2' if @api_version == 2
      return base_uri
    end
  end
end
