desc "Scrape LS Escapes"
task :update_escapes => :environment do
  require 'nokogiri'
  require 'open-uri'
  require 'mechanize'

  agent = Mechanize.new

  # get the escapes page with Mechanize
  escapes_index = agent.get("http://www.livingsocial.com/escapes")

  # find links with /escapes and iterate over each escape
  escape_links = escapes_index.links_with(:href => %r{/escapes/})


  escape_links.each do |escape|
    escape_page = escape.click

    puts escape_page.uri.to_s.inspect

    orig_url = escape_page.uri.to_s
    LOCATION_REGEX = /(\d+)/
    LOCATION_REGEX =~ orig_url
    ls_id = $1

    # parse Mechanize'd escape with Nokogiri
    escape_doc = Nokogiri::HTML(open(escape_page.uri.to_s))

    attrs = {}

    attrs["title"]      = escape_doc.css('title').text.split(" - ").first.strip           # note the spaces between hyphen to allow hyphenated words in title
    attrs["description"]= escape_doc.css('.description').text
    attrs["venue"]      = escape_doc.css('.deal-title p').text.split(%r{\W{2,}}).first
    attrs["details"]    = escape_doc.css('.highlights ul li').text.gsub("\n","--")
    attrs["price"]      = escape_doc.css('.deal-price').text.gsub("\n","").strip
    attrs["phone"]      = escape_doc.css('.meta .phone').text.gsub("|","")
    attrs["street"]     = escape_doc.css('.meta .street_1').text.gsub("\n","--")
    attrs["city"]       = escape_doc.css('.deal-title p').text.split(%r{\W{2,}})[-2]
    attrs["state"]      = escape_doc.css('.deal-title p').text.split(",")[-1].strip
    attrs["zipcode"]    = escape_doc.xpath("//br/following-sibling::text()").text.split(" ").last
    attrs["expiration"] = escape_doc.css('.fine-print p').text.split(%r{\b[A-Z]+\b}).last.strip
    attrs["livingsocial_url"] = escape_page.uri.to_s
    attrs["livingsocial_id"] = ls_id.to_s

    lat_long =  escape_doc.css('.directions a').map { |link| link['href'] }.join("").split("=")[-1]

    if lat_long.split(",")[0]
      attrs["latitude"] = lat_long.split(",")[0].strip
    end
    if lat_long.split(",")[1]
      attrs["longitude"] = lat_long.split(",")[1].strip
    end

    puts attrs.inspect

    if e = Escape.find_by_title(attrs["title"])
      puts "adding attrs"
      puts attrs["livingsocial_url"]
      puts attrs["livingsocial_id"]
      puts e.update_attributes(attrs)
    end

    # courtesy sleep throttle
    sleep(1)
  end
end
