class GamesReleaseDates::VideoGame
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
end
