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

	    it "populates title" do
	    	expect(page).to have_title 'Comments Dashboard'
	    end

	    describe "masthead" do
	    	it "displays title"do
	    	  expect(page).to have_selector 'h1', text:'Comments Dashboard'
	      end
	      
	      it "displays subtitle" do
	        expect(page).to have_selector 'h2', text:"Read comments from your favourite blogs."
	      end
	    end

    end
  end
end
