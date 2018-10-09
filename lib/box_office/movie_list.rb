module BoxOffice
  class MovieList

    def self.list
      self.scrape_imdb
    end

    def self.scrape_imdb
      doc = BoxOffice::Scrapper.scrape("/chart/boxoffice")

      movies_array = doc.css(".chart .titleColumn")
      movies_array.map do |movie|
        {
          title: movie.text.strip,
          url: movie.css("a").attribute("href").value
        }
      end
    end
  end
end
