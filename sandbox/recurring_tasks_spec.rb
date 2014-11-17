#recurring_tasks_spec.rb

require './recurring_tasks'
require 'rspec/collection_matchers'

RSpec.describe Date do
  first_date = Date.new(2014, 11, 30)
  recurrences = 2
  second_date = Date.new(2014, 12, 30)
  third_date = Date.new(2015, 01, 30)
  fourth_date = Date.new(2015, 02, 28)

  it 'returns false if a recurrence is less than 1' do
    expect(repeated_task(first_date, 0)).to eq false
  end

  it 'returns false if a recurrence is greater than 12' do
    expect(repeated_task(first_date, 13)).to eq false
  end

  it 'returns an array' do
    expect(repeated_task(first_date, recurrences)).to be_kind_of(Array)
  end

  it 'returns three elements in that array' do
    expect(repeated_task(first_date, recurrences)).to have(3).items
  end

  it 'matches the dates and adds year' do
    expect(repeated_task(first_date, recurrences)).to match_array([first_date, second_date, third_date])
  end

  it 'copes with lower date range in feb' do
    expect(repeated_task(first_date, 3)).to match_array([first_date, second_date, third_date, fourth_date])
  end
end
