require 'spec_helper'

describe "Home Page" do
	describe "GET /" do
    
    context "empty database" do

      before(:each) do
        visit "/"
      end

	    it "render success" do
	  	  expect(page.status_code).to be(200)
	    end

    end
  end
end
