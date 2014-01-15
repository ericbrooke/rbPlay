require 'restaurant'

class Guide

  def initialize(path=nil)
    Restaurant.filepath = path
    if Restaurant.file_exists?
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
      print "> "
      user_response = gets.chomp
      result = do_action(user_response)
    end
    farewell
  end

  def do_action(action)
    case action
    when 'list'
      puts "Listing.."
    when 'find'
      puts "Finding..."
    when 'add'
      puts 'Adding...'
    when 'quit'
      return :quit
    else "\nPlease put one of the following commands: list, find, add or quit.\n"
    end
  end

  def intro
    puts "\nWelcome to Food Finder \n"
    puts "This lets you store your favourite places to eat food\n\n"
  end

  def farewell
    puts "\nTime to nom nom\n"
  end

end
