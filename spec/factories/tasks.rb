# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :text
#  status      :integer          default("not_yet")
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
