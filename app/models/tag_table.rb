# == Schema Information
#
# Table name: tag_tables
#
#  id         :integer          not null, primary key
#  tag_id     :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TagTable < ActiveRecord::Base
  belongs_to :tag
  belongs_to :product
end
