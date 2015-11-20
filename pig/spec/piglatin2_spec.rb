require 'spec_helper'
require_relative '../piglatin2'

RSpec.describe "test" do
  it "it should convert hello into ellohay" do
    expect(Piglatin.new("hello").translated).to eq "ellohay"
  end

  it "it should convert hello world into ellohay orldway" do
    expect(Piglatin.new("hello world").translated).to eq "ellohay orldway"
  end

  it "it should convert Hello World into Ellohay Orldway" do
    expect(Piglatin.new("Hello World").translated).to eq "Ellohay Orldway"
  end

  it "it should convert Hello, world! into Ellohay, orldway!" do
    expect(Piglatin.new("Hello, World!").translated).to eq "Ellohay, orldway!"
  end

  it "it should convert eat apples into eatay applesay" do
    expect(Piglatin.new("eat apples").translated).to eq "eatay applesay"
  end

  it "it should convert dragons strike quickly into agonsdray ikestray icklyquay" do
    expect(Piglatin.new("dragons strike quickly").translated).to eq "agonsdray ikestray icklyquay"
  end
end
