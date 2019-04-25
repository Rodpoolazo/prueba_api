# se crea una web a partir de las fotos de jsonplaceholder



data = request('https://jsonplaceholder.typicode.com/photos')[0..10] # Limitamos los resultados a 10
photos = data.map{|x| x['url']}
html = ""
photos.each do |photo|
 html += "<img src=\"#{photo}\">\n"
end
File.write('output.html', html)
