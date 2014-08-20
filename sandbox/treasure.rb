class Thing
    def set_name (aName)
      @name = aName
    end

    def get_name
      @name
    end

    def set_description (aDescription)
      @description = aDescription
    end

    def get_description
      @description
    end
end

class Treasure < Thing
    def initialize(aName, aDescription, aValue)
      super( aName, aDeescription)
      @value = value
    end

    def get_value
      @value
    end

    def set_value
      @value

    def to_s
     "The #{@name} Treasure is #{@description}\n"
    end
end

thing = Thing.new
thing.set_name("A lovely Thing")
puts thing.get_name

t1 = Treasure.new("Sword", "an elvish weapon")
t2 = Treasure.new("Shield", "a dwarven shield")

puts t1.to_s
puts t2.to_s

puts "Inspecting 1st treasure: #{t1.inspect}"
