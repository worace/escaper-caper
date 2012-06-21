desc "Scrape LS Escapes"
task :scrape_escapes => :environment do
  require 'nokogiri'
  require 'open-uri'
  require 'mechanize'

  agent = Mechanize.new

  # get the escapes page with Mechanize
  escapes_index = agent.get("http://www.livingsocial.com/escapes")

  # find links with /escapes and iterate over each escape
  escape_links = escapes_index.links_with(:href => %r{/escapes/})


  escape_links[0..5].each do |escape|
    escape_page = escape.click
    puts escape_page.uri.to_s.inspect

    #uri = URI.parse(escape_page.uri.to_s)

    #puts uri.inspect

    # parse Mechanize'd escape with Nokogiri
    escape_doc = Nokogiri::HTML(open(escape_page.uri.to_s))

    puts escape_doc.css('.description').text

    attrs = {}

    attrs["title"]      = escape_doc.css('title').text.split(" - ").first.strip           # note the spaces between hyphen to allow hyphenated words in title
    attrs["description"]= puts escape_doc.css('.description').text
    attrs["venue"]   = escape_doc.css('.deal-title p').text.split(%r{\W{2,}}).first
    attrs["details"]    = escape_doc.css('.highlights ul li').text.gsub("\n","--")
    attrs["price"]      = escape_doc.css('.deal-price').text.gsub("\n","").strip
    attrs["phone"]      = escape_doc.css('.meta .phone').text.gsub("|","")
    attrs["street"]     = escape_doc.css('.meta .street_1').text.gsub("\n","--")
    attrs["city"]       = escape_doc.css('.deal-title p').text.split(%r{\W{2,}})[-2]
    attrs["state"]      = escape_doc.css('.deal-title p').text.split(",")[-1].strip
    attrs["zipcode"]    = escape_doc.xpath("//br/following-sibling::text()").text.split(" ").last
    attrs["expiration"] = escape_doc.css('.fine-print p').text.split(%r{\b[A-Z]+\b}).last.strip

    puts attrs.inspect


    ## Persist Escape from scraped data
    #db_escape = Escape.find_or_initialize_by_title(escape_title)
    #db_escape.location = escape_location
    #db_escape.details = escape_details
    #db_escape.price = escape_price
    #db_escape.phone = escape_phone
    #db_escape.street = escape_street
    #db_escape.city = escape_city
    #db_escape.state = escape_state
    #db_escape.zipcode = escape_zipcode
    #db_escape.expiration = escape_expiration.to_date
    #db_escape.save
    #

    # courtesy sleep throttle
    sleep(1)
  end
end
