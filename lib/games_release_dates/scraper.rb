class GamesReleaseDates::Scraper
  def get_page
    Nokogiri::HTML(open("http://www.vg247.com/2016/05/11/video-game-release-dates-2016/"))
  end

  def make_list
    videogames = []
    self.get_page.css("div#article section ul li").each do |vg|
      videogames << vg.text.upcase
    end
    videogames
  end
end
