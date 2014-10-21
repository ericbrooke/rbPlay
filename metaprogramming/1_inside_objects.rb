# Inside the object model
class MyClass
  def my_method
  @v =1
  end
end

obj.class
obj.my_method
obj.instance_variables
obj.methods.grep(/my/)

String.instance_methods == "abc".methods
String.methods == "abc".methods

"hello".class
String.class
Class.class

Class.instance_methods(false)
# false do not include Super

Array.superclass
Object.superclass
BasicObject.superclass

BasicObject.instance_methods

Class.superclass
# A class is a Module and a Module is an object

class MyClass; end
obj1 = MyClass.new
obj2 = MyClass.new

my_class = Myclass
# Variables can reference a class

# Constants begin with a capital i.e. class names

module MyModule
  MyConstant = 'Outer constant'

  class MyClass
    MyConstant = 'Inner constant'
  end
end

# Different scopes, the paths of constants can be followed ::

module M
  class C
    X = 'a constant'
  end

  C::X
end

M::C::X

Y = 'a root-level constant'

module M
  Y = 'a constant in M'
  Y # a constant in M
  ::Y # a root level
end

M.constants
Module.constants.include? :Object
Module.constants.include? :Module

module M
  class C
    module M2
      Module.nesting
    end
  end
end

module Rake
  class Task
  end
end
# Wrapping in a module is useful for namespacing and avoiding clases
# Rake::Task

# load '' loads a file and excutes it require imports

obj3 = MyClass.new
obj3.instance_variable_set("@x", 10)
