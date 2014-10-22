# my.string.reverse() my_string is the receiver

class MyClass
  def my_method; 'my_method()'; end
end

class MySubClass < MyClass
end

obj = MySubClass.new
obj.my_method()

MySubClass.ancestors

#both classes and modules are included

#Modules and lookups
module M1
  def my_method
    'M1#mymethod()'
  end
end

class C
  include M1
end

class D <C; end

D.ancestors

class C2
  prepend M1
end

#prepend allows you add a module (not class) below the inc. class
class D2 < C2; end

D2.ancestors

# Mutiple Inculsions
# ruby will include only once

module M1; end

module M2
  include M1
end

module M3
  prepend M1
  include M2
end

# The Kernel - its a module
Kernel.private_instance_methods
Kernel.private_instance_methods.grep(/^pr/)
