class GamesReleaseDates::CLI
  def call
    menu
    list_releases
  end

  def list_releases
    puts <<~eos
    ***JANUARY - PS4***
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

  def menu
    puts "Welcome to the Video Game Release Date CLI"
    puts "What month would you like to search the dates for?"
    month_input = gets.strip
    puts "What system would you like to search for?"
    system_input = gets.strip
  end
end
