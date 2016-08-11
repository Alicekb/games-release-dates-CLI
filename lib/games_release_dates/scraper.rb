class GamesReleaseDates::Scraper
  def get_page
    Nokogiri::HTML(open("http://www.vg247.com/2016/05/11/video-game-release-dates-2016/"))
  end

  def make_list
    self.get_page.css("div#article section ul li").each do |vg|
      #.gsub(/\([^\(]+/,"") - finds games name
      GamesReleaseDates::VideoGame.new()
      vg.text.upcase
    end
  end

  def get_game(name)
    Nokogiri::HTML(open("http://thegamesdb.net/api/GetGame.php?name=#{name}"))
  end

  def game_overview(name)
    self.get_game(name).at_css("overview").text
  end
end
