class GamesReleaseDates::VideoGames
  attr_accessor :name, :consoles, :release_date

  @@video_games = []

  def initialize(params = {})
    @name = params[:name]
    @consoles = params[:consoles]
    @release_date= params[:release_date]
    @@video_games << self
  end

  def self.all
    @@video_games
  end

  def self.list_releases(month, console)
    @searched_games = []
    self.all.each do |vg|
      if vg.release_date.to_s.include?("#{month}") && vg.consoles.to_s.include?("#{console}")
        puts "#{@searched_games.length+1}. #{vg.name} #{vg.consoles} - #{vg.release_date}"
        @searched_games << vg.name
      end
    end
  end

  def self.learn_more(index)
    puts "****** #{@searched_games[index]} *******"
    GamesReleaseDates::Scraper.new.get_game("#{@searched_games[index]}")
  end
end
