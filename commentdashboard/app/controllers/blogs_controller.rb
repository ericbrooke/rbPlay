class BlogsController < ApplicationController

helper_method :recent_blogs

protected

	def recent_blogs
		Blog.recent
	end

end
