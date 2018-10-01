module BoxOffice
  class MovieList

    IMDB_BASE_URL = "https://www.imdb.com"

    def self.list
      self.scrape_imdb
    end

    def self.scrape(url)
      Nokogiri::HTML(open("#{IMDB_BASE_URL}/#{url}"))
    end

    def self.scrape_imdb
      doc = self.scrape("/chart/boxoffice")
      
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
