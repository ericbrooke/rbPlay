require 'spec_helper'

describe "Home Page" do
	describe "GET /" do

	  it "render success" do
	  	visit "/"
	  	expect(page.status_code).to be(200)
	  end

  end
end
