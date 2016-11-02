# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  price       :decimal(, )
#  images      :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#

class Product < ActiveRecord::Base
  has_one :product_detail
  has_many :tag_tables
  has_many :tags, through: :tag_tables
  # allow nested form_for
  accepts_nested_attributes_for :product_detail, :tags
end
