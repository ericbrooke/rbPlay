RSpec::Matchers.define :match_date do |expected_string|
  match do |actual_date|
    format_date(actual_date) == expected_string
  end

  failure_message_for_should do |actual_date|
    actual_date_string = format_date actual_date
    "expected that #{actual_date_string} would match #{expected_string}"
  end

  failure_message_for_should_not do |actual_date|
    actual_date_string = format_date actual_date
    "expected that #{actual_date_string} would not match #{expected_string}"
  end

  description do
    "match #{expected_string}"
  end

  def format_date date
    "%d-%02d-%02d" % [date.year, date.month, date.day]
  end

end
