require 'open-uri'
require 'nokogiri'

class MarvelCharacters::Scraper

  def get_parsed_pages

    main_url= "https://comicvine.gamespot.com/profile/theoptimist/lists/top-100-marvel-characters/32199/"

    document = open(main_url)
    content = document.read
    parsed_main_page= Nokogiri::HTML(content)

    base_character_url = "https://comicvine.gamespot.com"
    character_url = parsed_main_page.css('div#default-content a')[10]["href"]
    final_character_url = "#{base_character_url}#{character_url}"
    document2 = open(final_character_url)
    content2 = document2.read
    parsed_character_page = Nokogiri::HTML(content2)

end

end #class
