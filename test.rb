require 'doge_api'

$my_api_key = 'API_KEY'
$my_address = 'DBv97MSG4gNjcGoHCMX1nfanLjzBgVERi9'
$my_api_address = 'DPf8M6McXUZW5zDxwAKXAfid4A78P8o21M'

doge_api = DogeApi::DogeApi.new($my_api_key, version=2)
doge_api.get_balance
doge_api.withdraw :amount => 5, :payment_address => $my_address
doge_api.get_new_address :address_label => 'my pretty address'
doge_api.get_my_addresses
doge_api.get_address_received :payment_address => $my_api_address
doge_api.get_address_by_label :address_label => 'main'
doge_api.get_difficulty
doge_api.get_current_block
doge_api.get_current_price

doge_chain = DogeApi::DogeChain.new
doge_chain.addressbalance $my_address
doge_chain.addresstohash $my_address
doge_chain.checkaddress $my_address
doge_chain.decode_address $my_address
doge_chain.getblockcount
doge_chain.getdifficulty
doge_chain.getreceivedbyaddress $my_address
doge_chain.getsentbyaddress $my_address
doge_chain.hashtoaddress '4A559E6A61B91E42B1DE8ABAC62655B210A22537'
doge_chain.nethash
doge_chain.totalbc
doge_chain.transactions
