module Printable
  def print
    "print"
  end

  def prepare_cover
    "prepare_cover"
  end
end

module Document
  def print_to_screen
    prepare_cover
    format_for_screen
    print
  end

  def format_for_screen
    "format_for_screen"
  end

  def print
    'print'
  end
end

class Book
  include Document
  include Printable
end

b = Book.new
b.print_to_screen

Book.ancestors
