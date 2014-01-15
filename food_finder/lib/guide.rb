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
    #action loop
    #what do you want to do
    #do that action
    # repat untils user quits
    farewell
  end

  def intro
    puts "\nWelcome to Food Finder \n"
    puts "This lets you store your favourite places to eat food\n\n"
  end

  def farewell
    puts "\nTime to nom nom\n"
  end

end
