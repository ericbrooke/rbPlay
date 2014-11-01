# open class
class String
  def to_alphanumeric
    gsub(/[^w|s]/, '')
  end
end

# refinements_in_file

module StringExtensions
  refine String do
    def to_alphanumeric
      gsub(/[^w|s]/, '')
    end
  end
end

# refinement is only active when using
using StringExtensions

# refinements in modules for ruby 2.1

module StringExtensions
  refine String do
    def reverse
      "esrever"
    end
  end
end

module StringStuff
  using StringExtensions
  "my_string".reverse
end
