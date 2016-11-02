# == Schema Information
#
# Table name: product_details
#
#  id          :integer          not null, primary key
#  product_id  :integer
#  images      :text
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ProductDetail < ActiveRecord::Base
  belongs_to :product
  has_many :comments, dependent: :destroy
end
