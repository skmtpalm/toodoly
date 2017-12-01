# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :text             not null
#  status      :integer
#  due         :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Task < ApplicationRecord
  include FlashMessage

  enum status: { not_yet: 0, started: 1, done: 2 }

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 100 }
end
