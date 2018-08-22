class MarvelCharacters::Characters

  attr_accessor :super_name, :real_name, :character_type, :number_of_powers
=begin
  @@all = []
  def initialize(super_name=nil, real_name=nil, character_type=nil, number_of_powers=nil)
    @super_name = super_name
    @real_name = real_name
    @character_type = character_type
    @number_of_powers = number_of_powers
    @@all << self
  end

  def self.all
    puts @@all
  end

  def self.find(number)
    self.all(number)
  end
=end

  def self.get_character_info(input)
   character_page = MarvelCharacters::Scraper.new.get_character_page(input)
   character_page.css('div.wiki-details').css('table').css('tr')[0].css('td').css('div').css('span').text


  end

  def self.get_super_name(input)

#    @@super_name = self.get_character_info(input).css('div.wiki-details').css('table').css('tr')[0].css('td').css('div').css('span').text

  end

  def self.get_real_name(input)
    real_name  = self.get_character_info(input).css('div.wiki-details').css('table').css('tr')[1].css('td').css('div').css('span').text
  end

  def self.get_character_type(input)
    character_type = self.get_character_info(input).css('div.wiki-details').css('table').css('tr')[6].css('td').css('div').css('span').text
  end

  def self.get_number_of_powers(input)
    number_of_powers = self.get_character_info(input).css('div.wiki-details').css('table').css('tr')[11].css('td/div[1]/div').length
  end

  def self.get_list_of_powers(input)
    list_of_powers =  self.get_character_info(input).css('div.wiki-details').css('table').css('tr')[11].css('td/div[1]/div').children.each{|one_power| puts one_power}
  end

end #end Class
