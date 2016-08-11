class GamesReleaseDates::VideoGame
  attr_accessor :name, :consoles, :release_dates

  @@video_games = []

  def initalize(params = {})
    @name = params[:name]
    @consoles = params[:consoles]
    @release_dates= params[:release_dates]
    @@video_games << self
  end

  def self.all?
    @@video_games
  end
end
