require 'restaurant'

class Guide

  class Config
    @@actions = ['list','find','add','quit']

    def self.actions; @@actions; end
  end


  def initialize(path=nil)
    Restaurant.filepath = path
    if Restaurant.file_usable?
      puts "Found the Restaurant file"
    elsif Restaurant.create_file
      puts "No Restaurant file found, creating a new one"
    else
      puts "Cannot create restaurant file, exiting App"
      exit!
    end
  end

  def launch
    intro
    result = nil
    until result == :quit 
      action = get_action
      result = do_action(action)
    end
    farewell
  end

  def get_action
    action = nil
    until Guide::Config.actions.include?(action)
      puts "Actions: " + Guide::Config.actions.join(", ") if action
      print "> "
      user_response = gets.chomp
      action = user_response.downcase.strip
    end
    return action
  end

  def do_action(action)
    case action
    when 'list'
      list
    when 'find'
      puts "Finding..."
    when 'add'
      add
    when 'quit'
      return :quit
    else "\nPlease put one of the following commands: list, find, add or quit.\n"
    end
  end

  def add
    puts "\nAdd a restaurant\n\n".upcase

    restaurant = Restaurant.build_using_questions

    if restaurant.save
      puts "\nRestaurant Added\n\n"
    else
      puts "\nSave Error: Restaurant not added \n\n"
    end
  end

  def list
      puts "\nList Restaurants\n\n".upcase
      restaurants = Restaurant.saved_restaurants
      restaurants.each do |rest|
        puts rest.name + " | " + rest.cuisine + " | " + rest.price
      end
  end

  def intro
    puts "\nWelcome to Food Finder \n"
    puts "This lets you store your favourite places to eat food\n\n"
  end

  def farewell
    puts "\nTime to nom nom\n\n"
  end

end
