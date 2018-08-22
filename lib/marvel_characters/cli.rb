class MarvelCharacters::CLI

  def call
    puts ""
    puts "Get Some Interesting Information about the Top 10 Marvel Characters"
    puts ""
    main_page = MarvelCharacters::Scraper.new.get_main_page

    count = 0

    #Provide List View of Characters

    while count < 10
      puts main_page.css('h3')[count].text
      count +=1
    end

    start
  end #end call

  def start
    puts ""
    puts "Please enter a number from 1 to 10."
    puts ""
    input = gets.strip.to_i-1

    print_character(input)
    select_another_character

  end #end start

  def print_character(input)
    character_array = MarvelCharacters::Characters.get_character_info(input)

    puts "Super Name:       "      +   character_array[0].to_s
    puts "Real Name:        "      +   character_array[1].to_s
    puts "Character Type:   "      +   character_array[2].to_s
    puts "Number of Powers: "      +   character_array[3].to_s
    #puts "List of Powers:   "     +    list_of_powers

    #character_array[4][.each {|one_power| puts one_power}
    #  puts character_array[4][0].to_s

#Previous Logic Tested
    #puts "Super Name: " + character.get_character_info(input).to_s
    #puts "Super Name: #{character.get_character_info(input)}"
    #puts "Super Name:          #{character.get_super_name}"
    #puts "Super Name:          #{character.super_name}"
    #puts "Real Name:           #{character.get_real_name(input)}"
    #puts "Character Type:      #{character.get_character_type(input)}"
    #puts "Number of Powers:    #{character.get_number_of_powers(input)}"

    puts "List of powers are:"
    puts MarvelCharacters::Characters.get_list_of_powers(input)
    puts ""
    puts '--------------------------------'
  end

  def select_another_character

    puts ""
    puts "Would you like to see another Marvel Character- Enter Y or N?"

    input2 = gets.strip.downcase

    if input2 == "y"
    call
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
end #end Class
