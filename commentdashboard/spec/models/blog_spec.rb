require 'spec_helper'

describe Blog do

  let(:blog) { Blog.new(title: "My Blog", comments_feed_url:"http://example./comments/feed") }

  describe "attributes" do

  	it { expect(blog).to validate_presence_of :title }
  	it { expect(blog).to validate_uniqueness_of :title }

  	it { expect(blog).to validate_presence_of :comments_feed_url }
  	it { expect(blog).to validate_uniqueness_of :comments_feed_url }

    it "saves attributes" do
      blog.save!
      expect(blog).to be_valid
    end
  end
	
	describe "permalink" do

		it "builds from title" do
      blog.build_permalink
      expect(blog.permalink).to eq 'my-blog'
		end
  end

end
