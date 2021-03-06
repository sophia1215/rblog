# == Schema Information
#
# Table name: settings
#
#  id                 :integer          not null, primary key
#  site_name          :string
#  post_per_page      :integer
#  under_maintenance  :boolean
#  prevent_commenting :boolean
#  tag_visibility     :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Setting < ActiveRecord::Base
  def self.site_name
    Setting.first.try(:site_name)
  end

  def self.post_per_page
    Setting.first.try(:post_per_page)
  end

  def self.tag_visible?
    Setting.first.try(:tag_visibility)
  end
end
