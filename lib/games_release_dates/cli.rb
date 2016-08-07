class GamesReleaseDates::CLI
  def call
    @release_list = GamesReleaseDates::Scraper.new.make_list
    puts "************VIDEOGAME RELEASE DATES************"
    menu
  end

  def menu
    systems = ["PC", "XBOX", "PS4"]
    system_input = nil

    puts <<~eos
        Please enter the system you would like to see releases for:
        PC   ||   XBOX   ||   PS4   ||   EXIT
      ---------------------------------------------------
    eos
    system_input = gets.strip.upcase

    if system_input != "EXIT" && systems.any? {|sys| sys == system_input}
      months(system_input)
    elsif system_input == "EXIT"
      puts "Thank you! Please have a nice day!"
    else
      menu
    end
  end

  def months(system)
    months = ["JANUARY","FEBRUARY","MARCH","APRIL","MAY","JUNE","JULY","AUGUST","SEPTEMBER","OCTOBER","NOVEMBER","DECEMBER"]
    month_input = nil

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
      list_releases(month_input,system)
    else
      months(system)
    end
  end

  def list_releases(month, system)
    @release_dates = []
    overview_input = nil

    puts <<~eos
    *** #{month} - #{system} ***
    -----------------------------------------------------------
    eos
    @release_list.each do |games|
      @release_dates << games if games.include?("#{system}") && games.include?("– #{month}")
    end

    @release_dates.each_with_index do |game, index|
      puts "#{index+1}. #{game}"
    end

    learn_more(system)
  end

  def learn_more(system)
    puts <<~eos
    -----------------------------------------------------------
    Please enter the number of the game you would like to learn more about:
    eos
    overview_input = gets.to_i

    if overview_input <= @release_dates.length && overview_input > 0

      game_name = @release_dates[overview_input-1].gsub(/\([^\(]+/,"")
      overview = GamesReleaseDates::Scraper.new.game_overview(game_name)

      puts <<~eos
      *** #{game_name} - #{system} ***
      -----------------------------------------------------------
      #{overview}
      eos

    else
      learn_more
    end
  end
end
