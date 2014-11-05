class Lawyer; end
nick = Lawyer.new
nick.talk_simple

# NoMethodError: undefined method `talk_simple' for #<Lawyer:0x007fc09c192c88>
# looks in Lawyer, Object, PP, ObjectMixin, Kernel, BasicObject
# method_missing is a private method of BasicObject

nick.send :method_missing, :my_method

# overriding method_missing

class Lawyer
  def method_missing(method, *args)
    puts "You called: #{method}(#{args.join(', ')})"
    puts "(You also passed it a block)" if block_given?
  end
end

bob = Lawyer.new
bob.talk_simple('a','b') do
  # a block
end

# You called: talk_simple(a, b)
# (You also passed it a block)
# => nil
