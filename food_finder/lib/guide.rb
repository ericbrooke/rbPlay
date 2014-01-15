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
    output_action_header("Add a restaurant")

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
