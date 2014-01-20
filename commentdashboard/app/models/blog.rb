class Blog < ActiveRecord::Base

	validates :title, presence: true, uniqueness: true
	validates :comments_feed_url, presence: true, uniqueness: true
	

end
