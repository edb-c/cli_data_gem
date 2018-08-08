class MarvelCharacters::Character

  attr_accessor :super_name, :real_name, :character_type, :number_of_powers

  @@all = []

  def initialize(super_name=nil, real_name=nil, character_type=nil, number_of_powers=nil)

    @super_name = super_name
    @real_name = real_name
    @character_type = character_type
    @number_of_powers = number_of_powers
    @@aoll << self

  end

  def self.all
    @@all
  end

  def self.find(number)
    self.all(number-1)
  end

  def get_super_name
    super_name = parsed_character_page.css('div.wiki-details').css('table').css('tr')[0].css('td').css('div').css('span').text
  end

  def get_real_name
    real_name  = parsed_character_page.css('div.wiki-details').css('table').css('tr')[1].css('td').css('div').css('span').text
  end

  def get_character_type
    character_type = parsed_character_page.css('div.wiki-details').css('table').css('tr')[6].css('td').css('div').css('span').text
  end

  def get_number_of_powers
    number_of_powers = parsed_character_page.css('div.wiki-details').css('table').css('tr')[11].css('td/div[1]/div').length
  end

end #end Class

