require 'dogeapi'

api = DogeApi.new('13grx3ycrb6auppurfevho58q')

puts api.get_address_by_label 'main'
