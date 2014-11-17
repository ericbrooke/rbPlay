
# I would consider a gem such as https://github.com/seejohnrun/ice_cube
# but I am guessing you want to see some code ;-)
# I have also avoided Rails helpers for the same reason

require 'Date'

def repeated_task(first_date, recurrences)
  return false if recurrences.to_i < 1 || recurrences.to_i > 12
  return false unless first_date.is_a?(Date) # first_date.valid_date?

  dates =[]
  dates << first_date
  # return dates if recurrences == 1

  last_date = first_date
  1.upto(recurrences.to_i) do |i|
    dates << last_date.next_month(i)
  end
  dates
end

# def calculate_next_monthly_date(last_date, first_date)
#   if first_date.mday < days_in_month(last_date.next_month)
#     next_date = last_date.next_month
#     return next_date
#   elsif first_date.mday >= days_in_month(last_date.next_month)
#     last_day = days_in_month(last_date.next_month)
#     next_date = Date.new(last_date.year, last_date.month + 1, last_day)
#     return next_date
#   else
#     puts "something not right!"
#   end
# end
#
# def days_in_month(d)
#   Date.new(d.year, d.month, -1).day
# end
