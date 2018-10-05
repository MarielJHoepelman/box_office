module BoxOffice
  class CLI
    def call
      menu_options
    end

    def menu_options
      input = nil
      while input != 3
        puts "Welcome to the Box Office!"
        puts "Enter the number of your option:"
        puts "1. List Box Office"
        puts "2. Help"
        puts "3. Exit"
        input = gets.strip.to_i
        case input
        when 1
          movie_list
        when 2
          puts "show help intructions"
        end
      end
    end

    def movie_list
      list = BoxOffice::MovieList.list
      list.each_with_index do | movie, key |
        puts "#{key + 1}. #{movie[:title]}"
      end

      puts "Enter the movie number to see movie details or enter 0 to go back to the Main Menu"
      input = gets.strip.to_i
      m = Movies.find_or_create(list[input.to_i - 1])
      binding.pry
    end
  end
end
