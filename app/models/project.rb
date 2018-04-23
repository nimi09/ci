# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string(255)
#  description :string(255)
#  value1      :float
#  value2      :float
#  unit        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Project < ActiveRecord::Base
  attr_accessible :title, :description,  :value1, :value2, :unit
  belongs_to :user
  has_many :followed_users, through: :impacts, source: :followed

# seems not to be needed
#  validates :user_id, presence: true
    
    TITLE_REGEX = /\A[\w]\z/i #, format: { with: TITLE_REGEX }
    validates :title, presence: true, length: { maximum: 50 }
  
    DESCRIPTION_REGEX = /\A[a-zA-Z0-9-_\s]\z/ #, format: { with: DESCRIPTION_REGEX }
    validates :description, presence: true, length: { maximum: 300 }
  
    validates :value1, presence: true, numericality: { greater_than:  0 }
  
    validates :value2, presence: true, numericality: { greater_than:  0, less_than:  :value1 }

    UNIT_REGEX = /\A[a-zA-Z0-9-_]\z/ #, format: { with: UNIT_REGEX }
    validates :unit, presence: true, length: { maximum: 15 }

end
