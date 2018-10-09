module BoxOffice
  class MovieList
    attr_accessor :list

    def initialize
      @list = scrape_imdb
    end

    def self.list
      @list
    end

    def scrape_imdb
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
