class Blog < ActiveRecord::Base

	validates :title, presence: true, uniqueness: true
	validates :comments_feed_url, presence: true, uniqueness: true
	
	before_validation :build_permalink, on: :create

  def build_permalink
  	if self.title
  		self.permalink = self.title.parameterize
  	end
  end

  def to_param
  	permalink
  end

end
