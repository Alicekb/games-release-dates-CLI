class GamesReleaseDates::CLI
  def call
    puts "************VIDEOGAME RELEASE DATES************"
    menu
  end

  def menu
    consoles = ["PC", "XBOX", "PS4"]

    puts <<~eos
        Please enter the system you would like to see releases for:
        PC   ||   XBOX   ||   PS4   ||   EXIT
      ---------------------------------------------------
    eos
    console_input = gets.strip.upcase

    if console_input != "EXIT" && consoles.any? {|sys| sys == console_input}
      months(console_input)
    elsif console_input == "EXIT"
      puts "Thank you! Please have a nice day!"
    else
      menu
    end
  end

  def months(console)
    months = ["JANUARY","FEBRUARY","MARCH","APRIL","MAY","JUNE","JULY","AUGUST","SEPTEMBER","OCTOBER","NOVEMBER","DECEMBER"]

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
      list_releases(month_input,console)
    else
      months(console)
    end
  end

  def list_releases(month, console)
    GamesReleaseDates::Scraper.new.make_list

    puts <<~eos
    *** #{month} - #{console} ***
    -----------------------------------------------------------
    eos

    GamesReleaseDates::VideoGames.list_releases(month, console)


    puts "Would you like to learn more about a game? (Y/N)"
    learn_input = gets.strip
    if learn_input == "Y" || learn_input == "y"
      learn_more(console)
    elsif learn_input == "N" || learn_input == "n"
      puts "Would you like to search for another month? (Y/N)"
      another_month_input = gets.strip
        if another_month_input == "Y" || another_month_input == "y"
          months(console)
        else
          puts "Thank you! Have a nice day!"
        end
    else

    end
  end

  def learn_more(console)
    puts <<~eos
    -----------------------------------------------------------
    Please enter the number of the game you would like to learn more about:
    eos
    overview_input = gets.to_i

    if overview_input <= @release_dates.length && overview_input > 0

      game_name = @release_dates[overview_input-1].gsub(/\([^\(]+/,"")
      overview = GamesReleaseDates::Scraper.new.game_overview(game_name)

      puts <<~eos
      *** #{game_name} - #{console} ***
      -----------------------------------------------------------
      #{overview}
      -----------------------------------------------------------
      Would you like to search for another game? (Y/N)
      eos
      another_game_input = gets.strip

      if another_game_input == "Y" || another_game_input == "y"
        learn_more(console)
      else
        puts "Would you like to search for another month? (Y/N)"
        another_month_input = gets.strip
          if another_month_input == "Y" || another_month_input == "y"
            months(console)
          else
            puts "Thank you! Have a nice day!"
          end
      end
    else
      learn_more
    end
  end
end
