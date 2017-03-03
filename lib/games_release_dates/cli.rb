class GamesReleaseDates::CLI
  def call
    puts "************VIDEOGAME RELEASE DATES************"
    menu
  end

  def menu
    consoles = ["PC", "XBOX", "PS4"]
    months = ["JANUARY","FEBRUARY","MARCH","APRIL","MAY","JUNE","JULY","AUGUST","SEPTEMBER","OCTOBER","NOVEMBER","DECEMBER"]
    puts <<~eos
        Please enter the system you would like to see releases for:
        PC   ||   XBOX   ||   PS4   ||   EXIT
      ---------------------------------------------------
    eos
    console_input = gets.strip.upcase

    if console_input != "EXIT" && consoles.any? {|sys| sys == console_input}
      puts <<~eos
        Please enter the month you would like to see releases for:
          January       May        September
          February      June       October
          March         July       November
          April         August     December
        -----------------------------------------------------------
      eos
      month_input = gets.strip.upcase

      if months.any? {|mon| mon == month_input}
        GamesReleaseDates::Scraper.new.make_list
        puts <<~eos
        *** #{month_input} - #{console_input} ***
        -----------------------------------------------------------
        eos
        GamesReleaseDates::VideoGames.list_releases(month_input, console_input)

        puts "Please enter the number of the game you would like to learn more about?"
        learn_input = gets.strip.to_i
          if learn_input > 0
            puts GamesReleaseDates::VideoGames.learn_more(learn_input-1)
            puts "Thank you. Have a nice day."
          end
      else
        puts "I'm sorry that is not a valid entry. Please try again."
        menu
      end

    elsif console_input == "EXIT"
      puts "Thank you! Please have a nice day!"
    else
      menu
    end
  end
end
