require 'restaurant'
require 'support/string_extend'

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
      action, args = get_action #an array
      result = do_action(action, args)
    end
    farewell
  end

  def get_action
    action = nil
    until Guide::Config.actions.include?(action)
      puts "Actions: " + Guide::Config.actions.join(", ") if action
      print "> "
      user_response = gets.chomp
      args = user_response.downcase.strip.split(' ')
      action = args.shift #first word taken
    end
    return action, args #an array
  end

  def do_action(action, args=[])
    case action
    when 'list'
      list
    when 'find'
      keyword = args.shift #second word taken, anymore will be ignored
      find(keyword)
    when 'add'
      add
    when 'quit'
      return :quit
    else "\nPlease put one of the following commands: list, find, add or quit.\n"
    end
  end

  def add
    output_action_header("Add a restaurant" )

    restaurant = Restaurant.build_using_questions

    if restaurant.save
      puts "\nRestaurant Added\n\n"
    else
      puts "\nSave Error: Restaurant not added \n\n"
    end
  end

  def list
      output_action_header("Restaurants")
      restaurants = Restaurant.saved_restaurants
      output_restaurant_table(restaurants)
  end

  def find(keyword="")
    output_action_header("Find a Restuarant")
    if keyword
      restaurants = Restaurant.saved_restaurants
      found = restaurants.select do |rest|
        rest.name.downcase.include?(keyword.downcase) ||
        rest.cuisine.downcase.include?(keyword.downcase) ||
        rest.price.to_i <= keyword.to_i
      end
      output_restaurant_table(found)
    else
      puts "Find using a key phrase to search restaurants"
      puts "Examples: 'find chinese', 'find flying pig'\n\n"
    end


  end

  def intro
    puts "\nWelcome to Food Finder \n"
    puts "This lets you store your favourite places to eat food\n\n"
  end

  def farewell
    puts "\nTime to nom nom\n\n"
  end

  private 

  def output_action_header(text)
    puts "\n#{text.upcase.center(60)}\n\n"
  end

  def output_restaurant_table(restaurants=[])
    ##title bar
    print " " + "Name".ljust(30)
    print " " + "Cuisine".ljust(20)
    print " " + "Price".rjust(6) + "\n"
    puts "-" * 60
    restaurants.each do |rest|
      line = " " << rest.name.titleize.ljust(30)
      line << " " + rest.cuisine.titleize.ljust(20)
      line << " " + rest.formatted_price.rjust(6)
      puts line
    end
    puts "No restaurants found" if restaurants.empty?
    puts "-" * 60
  end


end
