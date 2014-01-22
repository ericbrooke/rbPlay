# == Schema Information
#
# Table name: blogs
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  permalink         :string(255)
#  comments_feed_url :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

require 'spec_helper'

describe Blog do

  let(:blog) { Blog.new(title: "My Blog", comments_feed_url:"http://example./comments/feed") }

  

  	it { expect(blog).to validate_presence_of :comments_feed_url }
  	it { expect(blog).to validate_uniqueness_of :comments_feed_url }

  	it { expect(blog).to have_many :comments}

    it "saves attributes" do
      blog.save!
      expect(blog).to be_valid
    end
  
	
	describe "permalink" do

		it "builds from title" do
      blog.build_permalink
      expect(blog.permalink).to eq 'my-blog'
		end
  end

  describe "refresh comments" do

  	it "populates comments" do
  		blog.save!
  		blog.comments.refresh
  		expect(blog.comments.length).to eq 30
  	end
  end

end
