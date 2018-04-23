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

require 'test_helper'

class ImpactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
