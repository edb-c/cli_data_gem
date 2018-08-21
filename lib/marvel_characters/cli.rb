class MarvelCharacters::CLI

  def call
    puts ""
    puts "Get Some Interesting Information about the Top 10 Marvel Characters"
    puts ""
    main_page = MarvelCharacters::Scraper.new.get_main_page

    count = 0

    while count < 10
      puts main_page.css('h3')[count].text
      count +=1
    end

    start
  end

  def start
    puts ""
    puts "Please enter a number from 1 to 10."
    puts ""
    input = gets.strip.to_i-1

    print_character(input)

    puts ""
    puts "Would you like to see another Marvel Character- Enter Y or N?"

    input2 = gets.strip.downcase
    if input2 == "y"
      start
    elsif input2 == "n"
      puts ""
      puts "Thank you for your time! Have a great day!"
      exit
    else
      puts ""
      puts "Invalid Entry - please try again."
      start
    end
  end

  def print_character(input)
    character = MarvelCharacters::Characters
    puts "Super Name:          #{character.get_super_name(input)}"
    puts "Real Name:           #{character.get_real_name(input)}"
    puts "Character Type:      #{character.get_character_type(input)}"
    puts "Number of Powers:    #{character.get_number_of_powers(input)}"
    puts "List of powers are:"
    puts character.get_list_of_powers(input)
    puts ""
    puts '--------------------------------'
  end
end #end Class
