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
    self.all.each_with_index do |vg, index|
      puts "#{vg.name} #{vg.consoles} - #{vg.release_date}" if vg.release_date.to_s.include?("#{month}") && vg.consoles.to_s.include?("#{console}")
    end
  end
end
