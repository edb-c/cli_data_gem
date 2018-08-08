class MarvelCharacters::CLI

  def call
    MarvelCharacters::Scraper.new.get_character
    puts "Get Interesting Information about the Top 10 Marvel Characters"
    start
  end

  def start
    puts ""
    puts "Please enter a number from 1 to 10.""
    input = gets.strip.to_i

    print_character(input)

    selected_character = MarvelCharacters::Character.find(input.to_i)

    puts ""
    puts "Would you like to see another Marvel Character? Enter Y or N"

    input = gets.strip.downcase
    if input == "y"
      start
    elsif input == "n"
      puts ""
      puts "Thank you for your time! Have a great day!"
      exit
    else
      puts ""
      puts "Invalid Entry - please try again."
      start
    end
  end

  def print_character(character)
    puts "Super Name:         #{character.super_name}"
    puts "Real Name:          #{character.real_name}"
    puts "Number of Powers:   #{character.number_of_powers}"
    puts "List of powers are:"
    parsed_content2.css('div.wiki-details').css('table').css('tr')[11].css('td/div[1]/div').children.each{|one_power| puts one_power}
    puts ""  
    puts '--------------------------------'
  end
end #end Class

