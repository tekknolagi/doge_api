require 'uri'
require 'open-uri'

class DogeApi
  attr_accessor :api_key

  def initialize(api_key)
    @api_key = api_key
    @base_uri = URI.parse('https://www.dogeapi.com/wow')
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
end
