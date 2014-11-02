class MyClass
  def my_method(my_arg)
    my_arg * 2
  end
end

obj = MyClass.new
obj.my_method(3)

obj.send(:my_method, 3)

# example of dynamic dispatch

def update_attributes(options = {})
  defaults = {}
  attributes = [:strength, :constitution, :dexterity, :inteliigence, :wisdom, :charisma]

  attributes.each do |attribute|
    defaults[attribute] = Character.send attribute
  end

  defaults.merge!(options).each do |key, value|
    send("#{key}=", value) if respond_to?("#{key}=")
  end
end

# Define methods dynamically

class MyClass
  define_method :my_method do |my_arg|
    my_arg * 3
  end
end

obj = MyClass.new
obj.my_method(2)
