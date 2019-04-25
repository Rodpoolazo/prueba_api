# prueba introduccion a Ruby
#ingresar a la nasa y obtener Api keys
#iwutJc7BeanIJwPUvAbt3Que7Iaw0kp9nygcO5TK

require 'uri'
require 'net/http'
require 'json'

def request(url_requested, api_key)
  url = URI(url_requested+api_key)
  http = Net::HTTP.new(url.host, url.port)
  request = Net::HTTP::Get.new(url)
  http.use_ssl = true
  response = http.request(request)
  return JSON.parse(response.body)
end
 data = request('https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=10&', 'api_key=iwutJc7BeanIJwPUvAbt3Que7Iaw0kp9nygcO5TK')
 data = data["photos"][0..7]

def build_web_page(data)
  #photos = data['photos'].map{|x| x['img_src']}
  #puts photos
  html = "<html>\n/<head>\n</head>\n<body>\n<ul>"
  data.each do |photo|
   html += "\t<li><img src=\"#{photo["img_src"]}\"></li>\n"

  end
  html += "</ul>\n</body>\n</html>"
 File.write('output.html', html)
end



  def photos_count(data)

    nuevo_hash = {}

    data.map {|y| nuevo_hash[y['camera']['name']] = 1 + nuevo_hash[y['camera']['name']].to_i}

    return nuevo_hash

end
build_web_page(data)
print photos_count(data)
