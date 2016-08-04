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
        PC   ||   XBOX ONE   ||   PS4   ||   EXIT
      ---------------------------------------------------
    eos
    system_input = gets.strip.upcase


    if system_input != "EXIT"
      puts <<~eos
        Please enter the month you would like to see releases for:
          January       May        September
          February      June       October
          March         July       November
          April         August     December
        ---------------------------------------------------
      eos
      month_input = gets.strip.upcase
      list_releases(month_input,system_input)
    else
      puts "Thank you! have a nice day!"
    end

  end

  def list_releases(month, system)
    puts <<~eos
    *** #{month.upcase} - #{system.upcase} ***
    ---------------------------------------------------
    eos
    @release_list.each do |games|
      puts games if games.include?("#{system}") && games.include?("– #{month}")
    end
  end
end
