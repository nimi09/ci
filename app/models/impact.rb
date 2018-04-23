# == Schema Information
#
# Table name: impacts
#
#  id          :integer          not null, primary key
#  follower_id :integer
#  project_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Impact < ActiveRecord::Base
#  attr_accessible :follower_id, :project_id
	belongs_to :follower_id, class_name: "User"
#	belongs_to  .... Listing 11.6

	validates :follower_id, presence: true
	validates :project_id, presence: true
end
