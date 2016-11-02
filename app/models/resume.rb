# == Schema Information
#
# Table name: resumes
#
#  id         :integer          not null, primary key
#  name       :string
#  attachment :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Resume < ActiveRecord::Base
    mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
    validates :name, presence: true # Make sure the owner's name is present.
end
