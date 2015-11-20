require 'spec_helper'
require_relative '../piglatin'

RSpec.describe "test" do
  it "it should convert hello into ellohay" do
    expect(Piglatin.translate_words("hello")).to eq "ellohay"
  end

  it "it should convert hello world into ellohay orldway" do
    expect(Piglatin.translate_words("hello world")).to eq "ellohay orldway"
  end

  it "it should convert Hello World into Ellohay Orldway" do
    expect(Piglatin.translate_words("Hello World")).to eq "Ellohay Orldway"
  end

  it "it should convert Hello, world! into Ellohay, orldway!" do
    expect(Piglatin.translate_words("Hello, World!")).to eq "Ellohay, orldway!"
  end

  it "it should convert eat apples into eatay applesay" do
    expect(Piglatin.translate_words("eat apples")).to eq "eatay applesay"
  end

  it "it should convert dragons strike quickly into agonsdray ikestray icklyquay" do
    expect(Piglatin.translate_words("dragons strike quickly")).to eq "agonsdray ikestray icklyquay"
  end
end
