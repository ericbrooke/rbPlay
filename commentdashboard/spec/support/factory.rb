module Factory
  class << self
	  def comments_feed_xml
		  File.read(File.join('spec', 'fixtures', 'feed.xml'))
	  end

	  def blog_attributes
			{
				title: "My Blog", 
				comments_feed_url:"http://example./comments/feed"
			}
	  end
  end
end