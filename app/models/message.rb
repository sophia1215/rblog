# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  content    :text
#  visitor_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ActiveRecord::Base
  belongs_to :visitor

  validates :content, presence: true

  def self.matching_fullname_or_content params
    joins(:visitor).where("fullname LIKE ? OR content LIKE ?", "%#{params}%", "%#{params}%")
  end

  def mark_read
    update(status: true) if status == false
  end
end
