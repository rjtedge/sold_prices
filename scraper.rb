# This is a template for a Ruby scraper on morph.io (https://morph.io)
# including some code snippets below that you should find helpful

# require 'scraperwiki'
# require 'mechanize'
#
# agent = Mechanize.new
#
# # Read in a page
# page = agent.get("http://foo.com")
#
# # Find somehing on the page using css selectors
# p page.at('div.content')
#
# # Write out to the sqlite database using scraperwiki library
# ScraperWiki.save_sqlite(["name"], {"name" => "susan", "occupation" => "software developer"})
#
# # An arbitrary query against the database
# ScraperWiki.select("* from data where 'name'='peter'")

# You don't have to do things with the Mechanize or ScraperWiki libraries.
# You can use whatever gems you want: https://morph.io/documentation/ruby
# All that matters is that your final data is written to an SQLite database
# called "data.sqlite" in the current working directory which has at least a table
# called "data".

require 'mechanize'
require 'scraperwiki'

agent = Mechanize.new
url = 'https://www.domain.com.au/sold-listings/?suburb=pascoe-vale-south-vic-3044,coburg-vic-3058,brunswick-west-vic-3055'

page = agent.get(url)

 
 page.search('.listing-result__address').each do |li|
    house = {
      address: li.at('.listing-result__left a meta').attr('content'),
      price: li.at('.listing-result__price').inner_text.strip,
      beds: li.at('.property-feature__feature-text-container').inner_text
    }

    p house
 end

    # ScraperWiki.save_sqlite([:title], member)


