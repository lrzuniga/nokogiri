require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://toronto.en.craigslist.ca/bia/"))

bikes = page.css('blockquote#toc_rows p.row span.pl a')

File.open('bikes.html', 'w') do |f|
  f.puts("<html>")
  f.puts("<head>")
  f.puts("<title> Intro to HTML/CSS</title>")
  f.puts("</head>")
  f.puts("<body>")
  f.puts("<h1>Bikes Rock!</h1>")


  f.puts("<ul>")

  bikes.each do |bike|
    f.puts("    <li>" + bike.text + "</li>")
  end

  f.puts("   </ul")
  f.puts("</body>\n")
  f.puts("</html>\n")
end
