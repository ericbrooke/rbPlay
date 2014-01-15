# Food Finder
#Launch this file from command line

APP_ROOT = File.dirname(__FILE__) #absolute path

# require "#{APP_ROOT}/lib/guide"
# require File.join(APP_ROOT, 'lib', 'guide.rb')	will work in windows and unix

$:.unshift(File.join(APP_ROOT, 'lib'))
require 'guide'

guide = Guide.new('restaurants.txt')
guide.launch