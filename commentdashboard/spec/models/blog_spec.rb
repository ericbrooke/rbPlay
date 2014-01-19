require 'spec_helper'

describe Blog do

  let(:blog) { Blog.new(title: "My Blog", comments_feed_url:"http://example./comments/feed") }

  it "saves attributes" do
    
    blog.save!
    expect(blog).to be_valid
  end

	
end
