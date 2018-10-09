module BoxOffice
  class CLI
    attr_accessor :list

    def call
      menu_options
    end

    def menu_options
      input = nil
      while input != 0
        puts ""
        puts "Welcome to the Box Office!"
        puts "=========================="
        puts "Enter the number of your option:"
        puts "1. List Box Office"
        puts "2. Help"
        puts "0. Exit"
        input = gets.strip.to_i
        case input
        when 1
          movie_list
          movie_input
        when 2
          show_help
        end
      end
    end

    def movie_list
      puts ""
      puts "Box Office"
      puts "=========="
      @list ||= BoxOffice::MovieList.new.list
      list.each_with_index do | movie, key |
        puts "#{key + 1}. #{movie[:title]}"
      end
    end

    def movie_input
      puts "Enter the movie number to see movie details or enter 0 to go back to the Main Menu."
      input = gets.strip.to_i

      if input != 0
        movie = Movies.find_or_create(@list[input.to_i - 1])
        puts ""
        puts "Title: #{movie.title}"
        puts "=========================="
        puts "Description: #{movie.description}"
        puts "Metascore: #{movie.metascore}"
        # puts "Cast: #{movie.cast.strip}"
        # binding.pry
      end
    end

    def show_help
      puts ""
      puts "Help"
      puts "===="
      puts "It's easy, just enter numbers"
    end
  end
end
