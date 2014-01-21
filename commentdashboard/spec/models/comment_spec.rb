# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  link        :string(255)
#  commenter   :string(255)
#  description :text
#  opined_at   :datetime
#  blog_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Comment do
  
  let(:comment) { Comment.new() }
  
  it { expect(comment).to validate_uniqueness_of :link }
  

end
