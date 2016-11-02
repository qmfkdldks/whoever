# == Schema Information
#
# Table name: tags
#
#  id          :integer          not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#

class Tag < ActiveRecord::Base
  has_many :tag_tables
  has_many :products, through: :tag_tables
end
