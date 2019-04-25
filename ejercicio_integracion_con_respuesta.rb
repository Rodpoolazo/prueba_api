# obteniendo los precios de bitcoins

require 'uri'
require 'net/http'

def request(url_requested)
  url = URI(url_requested)
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER

  request = Net::HTTP::Get.new(url)
  response = http.request(request)
  return JSON.parse(response.body)
end
prices = request('https://api.coindesk.com/v1/bpi/historical/close.json')['bpi']

# Solucion 1 : Seleciona las fechas en que los valores fueron menores que 5000
selected_data = prices.select {|k,v| v < 5000 }
selected_data.keys

# Solucion 2 : obtener un arreglo solo con los precios, filtrar el arreglo por
#los valores bajo los 5000 y luego utilizar un diccionario invertidos para buscarlos
under_5000 = prices.values.select {|x| x < 5000 }
dates = under_5000.map {|x| prices.invert[x]}
