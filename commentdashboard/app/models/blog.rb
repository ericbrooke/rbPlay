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

class Blog < ActiveRecord::Base

	validates :title, presence: true, uniqueness: true
	validates :comments_feed_url, presence: true, uniqueness: true
	
	before_validation :build_permalink, on: :create

	has_many :comments

  def build_permalink
  	if self.title
  		self.permalink = self.title.parameterize
  	end
  end

  def to_param
  	permalink
  end

end
