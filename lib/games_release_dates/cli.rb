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

  def list_releases(month, system) #Should call on list build from scrapper and pull dates
    puts <<~eos
    *** #{month} - #{system} ***
    Amplitude (PS4) – January 5
    Hardware: Rivals (PS4) – January 5
    Assassin’s Creed Chronicles: India (PC, PS4, Xbox One) – January 12
    The Banner Saga (PS4, Xbox One) – January 12
    Gone Home (PS4, Xbox One) – January 12
    Resident Evil 0 HD Remaster, and Resident Evil Origins Collection (PC, PS3, PS4, Xbox 360, Xbox One – January 19
    A Boy and His Blob (PC, PS4, Xbox One) – January 19
    The Witness (PC, PS4) – January 26
    Lego Marvel’s Avengers (PC, PS3, PS4, Xbox 360, Xbox One) – January 26
    Sébastien Loeb Rally Evo (PC, PS4, Xbox One) – January 29
    This War of Mine: The Little Ones (PS4, Xbox One) – January 29
    eos
  end
end
