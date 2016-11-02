# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  commenter         :string
#  body              :text
#  article_id        :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#  product_detail_id :integer
#

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  belongs_to :product_detail
  has_many :replies, class_name: "Comment", foreign_key: "reply_id"
                          
  validates :commenter, presence: true, length: { minimum: 5, maximum: 20 }
  validates :body, presence: true, length: { minimum: 5, maximum: 500 }
end
