require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://weather.gc.ca/"))

city_left = page.css('td.width-25 a')
weather_left = page.css('td.width-10.align-right')

city_right = page.css('td.table-border-left.width-20 a')
weather_right = page.css('td.align-right')

city_all = [city_left, weather_left, city_right, weather_right]

city_hash = 
File.open('weather.html', 'w') do |f|
  f.puts("<html>")
  f.puts("<head>")
  f.puts("<title> Intro to HTML/CSS</title>")
  f.puts("</head>")
  f.puts("<body>")
  f.puts("<h1>Canadian Weather - source: (http://weather.gc.ca)</h1>")
  f.puts("<ul>")

  city_all.each do |city|
    f.puts("<li>" + city.text + "</li>")
  end

  f.puts("</ul")
  f.puts("</body>\n")
  f.puts("</html>\n")
end

