class GamesReleaseDates::CLI
  def call
    @release_list = GamesReleaseDates::Scraper.new.make_list
    menu
  end

  def menu
    month_input = nil

    system_input = nil

    puts <<~eos
      ************VIDEOGAME RELEASE DATES************
        Please enter the system you would like to see releases for:
        PC   ||   XBOX   ||   PS4   ||   EXIT
      ---------------------------------------------------
    eos
    system_input = gets.strip.upcase

    if system_input != "EXIT"
      months(system_input)
    else
      puts "Thank you! have a nice day!"
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
      ---------------------------------------------------
    eos
    month_input = gets.strip.upcase

    if months.any? {|mon| mon == month_input}
      list_releases(month_input,system)
    else
      months(system)
    end
  end

  def list_releases(month, system)
    puts <<~eos
    *** #{month} - #{system} ***
    ---------------------------------------------------
    eos
    @release_list.each do |games|
      puts games if games.include?("#{system}") && games.include?("– #{month}")
    end
  end
end
