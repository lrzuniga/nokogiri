require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://weather.gc.ca/"))

city_left = page.css('td.width-25 a')
city_left_array = []
  city_left.each do |city|
  city_left_array << city.text
  end

city_right = page.css('td.table-border-left.width-20 a')
city_left_array = []
  city_left.each do |city|
  city_left_array << city.text
  end

city_right_array = []
  city_right.each do |city|
  city_right_array << city.text
  end

city_all = city_left_array.concat(city_right_array)

weather = page.css('td.align-right')
weather_all = []
  weather.each do |w|
  weather_all << w.text
  end

weather_hash = {}
  city_all.each_with_index do | city, index |
  weather_hash[city]=weather_all[index]
  end

File.open('weather.html', 'w') do |f|
  f.puts("<html>")
  f.puts("<head>")
  f.puts("<meta charset='UTF-8'>")
  f.puts("<title> Intro to HTML/CSS</title>")
  f.puts("</head>")
  f.puts("<body>")
  f.puts("<h1>Canadian Weather - source: (http://weather.gc.ca)</h1>")
  f.puts("<ul>")

  weather_hash.each do |city, weather|
    f.puts ("<li>") + city + " - " + weather + ("</li>")
  end

  f.puts("</ul")
  f.puts("</body>\n")
  f.puts("</html>\n")
end

