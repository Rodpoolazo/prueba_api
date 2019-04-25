require 'uri'
require 'net/http'
require 'json'

def request(address)
  url = URI(address)

  http = Net::HTTP.new(url.host, url.port)

  request = Net::HTTP::Get.new(url)
  request["User-Agent"] = 'PostmanRuntime/7.11.0'
  request["Accept"] = '*/*'
  request["Cache-Control"] = 'no-cache'
  request["Postman-Token"] = '4d9fd78e-3067-488e-8b85-37655dee583f,206d85c4-fdb8-46ff-a673-c71b30223999'
  request["Host"] = 'jsonplaceholder.typicode.com'
  
  request["Connection"] = 'keep-alive'
  request["cache-control"] = 'no-cache'

  response = http.request(request)
  JSON.parse response.read_body
end
  body = request('http://jsonplaceholder.typicode.com')
  body.each do |post|
  puts post['title']
end
