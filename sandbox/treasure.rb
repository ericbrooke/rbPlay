class Thing

  def initialize(aName, aDescription)
    @name = aName
    @description = aDescription
  end

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
      super(aName, aDescription)
      @value = aValue
    end

    def get_value
      @value
    end

    def set_value(aValue)
      @value = aValue
    end

    def to_s
     "The #{@name} Treasure is #{@description}\n"
    end
end

class Monster < Thing
  def initialize(aName, aDescription, aStrength)
    super(aName, aDescription)
    @strength = aStrength
  end

  def get_strength
    @strength
  end

  def set_strength(aStrength)
    @strength = aStrength
  end

  def to_s
   "The #{@name} Monster is #{@description}\n"
  end
end


thing = Thing.new("test", "description")
puts thing.get_name

t1 = Treasure.new("Sword", "an elvish weapon", 90)
t2 = Treasure.new("Shield", "a dwarven shield", 100)

puts t1.to_s
puts t2.to_s

m1 = Monster.new("Goblin", "A childlike green ugly thing", 2)
m2 = Monster.new("Kobold", "A small creature, with head of a dog", 3)

puts m1.to_s
puts m2.to_s
