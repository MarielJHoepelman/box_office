module BoxOffice
  class Scrapper
    IMDB_BASE_URL = "https://www.imdb.com"

    def self.scrape(url)
      Nokogiri::HTML(open("#{IMDB_BASE_URL}/#{url}"))
    end

  end
end
