# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  title       :string
#  text        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  like_number :integer          default(0), not null
#  like_list   :string           default(""), not null
#  view_number :integer          default(0), not null
#

class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :text, presence: true, length: { minimum: 5, maximum: 50000 }
end
