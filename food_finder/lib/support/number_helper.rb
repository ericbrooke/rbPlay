# ripped and adapted from Rails "number_to_currency" method

module NumberHelper

  def number_to_currency(number, options={})
    unit      = options[:unit]      || '$'
    precision = options[:precision] || 2
    delimiter = options[:delimiter] || ','
    seperator = options[:seperator] || '.'

    seperator = '' if precision == 0
    integer, decimal = number.to_s.split('.')

    i = integer.length
    until i <= 3
    	i -= 3
    	integer = integer.insert(i,delimiter)
    end
    
    if precision == 0
    	precise_decimal = ''
    else
    	#make sure decimal is not nil
    	decimal ||= "0"
    	#make sure decimal is not too large
    	decimal = decimal[0, precision-1]
    	#make sure decimal is not too short
    	precise_decimal = decimal.ljust(precision, "0")
    end

    return unit + integer + seperator + precise_decimal
  end

end