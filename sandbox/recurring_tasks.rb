
require 'Date'

def repeated_task(first_date, recurrences)
  return false if recurrences.to_i < 1 || recurrences.to_i > 12
  return false unless first_date.is_a?(Date)

  dates = []
  dates << first_date

  last_date = first_date
  1.upto(recurrences.to_i) do |i|
    dates << last_date.next_month(i)
  end
  dates
end
