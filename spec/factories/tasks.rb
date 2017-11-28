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

FactoryBot.define do
  factory :task do
    title "MyString"
    description ""
    due ""
  end
end
