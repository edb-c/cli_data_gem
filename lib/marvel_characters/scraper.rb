require 'open-uri'
require 'nokogiri'

class MarvelCharacters::Scraper

  def self.get_main_page

    main_url= "https://comicvine.gamespot.com/profile/theoptimist/lists/top-100-marvel-characters/32199/"
    document = open(main_url)
    content = document.read
    parsed_main_page= Nokogiri::HTML(content)

  end

  def self.get_character_info(input)

    base_character_url = "https://comicvine.gamespot.com"
    character_url = self.get_main_page.css('div#default-content a')[input]["href"]
    final_character_url = "#{base_character_url}#{character_url}"
    document2 = open(final_character_url)
    content2 = document2.read
    character_page = Nokogiri::HTML(content2)

    super_name = character_page.css('div.wiki-details').css('table').css('tr')[0].css('td').css('div').css('span').text

    real_name  = character_page.css('div.wiki-details').css('table').css('tr')[1].css('td').css('div').css('span').text

    character_type = character_page.css('div.wiki-details').css('table').css('tr')[6].css('td').css('div').css('span').text

    number_of_powers = character_page.css('div.wiki-details').css('table').css('tr')[11].css('td/div[1]/div').length

    #  list_of_powers =  character_page.css('div.wiki-details').css('table').css('tr')[11].css('td/div[1]/div').children.each{|one_power|  @character_array << one_power}

    #character_array << super_name << real_name << character_type << number_of_powers

    character_info = MarvelCharacters::Characters.new(super_name, real_name, character_type, number_of_powers)
    character_info
  end

#  def self.get_list_of_powers(input)

#    character_page = get_character_page(input)
#    @list_of_powers =  character_page.css('div.wiki-details').css('table').css('tr')[11].css('td/div[1]/div').children.each{|one_power| puts one_power}

#  end

end #class
