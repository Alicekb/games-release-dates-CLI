class GamesReleaseDates::Scraper
  def get_page
    Nokogiri::HTML(open("http://www.vg247.com/2016/05/11/video-game-release-dates-2016/"))
  end

  def make_list
    self.get_page.css("div#article section ul li").each do |vg|
      game_attr = vg.text.upcase.split(" – ")

      video_game = {:name => game_attr[0].gsub(/\s\([^\(]+/,""), :consoles => game_attr[0][/\([^\(]+/], :release_date => game_attr[1]}
      GamesReleaseDates::VideoGames.new(video_game)
    end
  end

  def get_game(name)
    Nokogiri::HTML(open("http://thegamesdb.net/api/GetGame.php?name=#{name}")).at_css("overview").text
  end
end
