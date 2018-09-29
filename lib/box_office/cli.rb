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
          puts "Listing Box Office..."
        when 2
          puts "show help intructions"
        end 
      end
    end
  end
end
