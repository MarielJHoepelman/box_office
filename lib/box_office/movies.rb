module BoxOffice
  class Movies
    attr_accessor :title, :description, :cast, :metascore, :url
    @@all = []

    def initialize(item)
      @url = item[:url]
      @title = item[:title]
      scrape_movie
      @@all << self
    end

    def scrape_movie
      doc = BoxOffice::Scrapper.scrape(url)
      @description = doc.css(".summary_text").text
      @metascore = doc.css(".metacriticScore").text
      @cast = doc.css(".cast_list tr td").text
      self
    end

    def self.all
      @@all
    end

    def self.create_by_url(item)
      new(item)
    end

    def self.find_by_title(item)
      all.find{|movie| movie.title == item[:title]}
    end

    def self.find_or_create(item)
      find_by_title(item) || create_by_url(item)
    end
  end
end
