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

require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) { build(:task) }

  context "title column" do
    it 'タスクが有用であること' do
      expect(task).to be_valid
    end

    it 'なければ有用じゃない' do
      task.title = ""
      expect(task).not_to be_valid
    end

    it '文字列の長さは 50文字以内であること' do
      task.title = 'b' * 51
      expect(task).not_to be_valid
    end
  end

  context 'description column' do
    it 'なくても有用である' do
      task.description = ''
      expect(task).to be_valid
    end

    it '文字のながさは 100 文字以内であること' do
      task.description = "a" * 101
      expect(task).not_to be_valid
    end
  end

  context 'status column' do
    it 'デフォルト値は not_yetであること' do
      new_task = create(:task)
      expect(new_task.status).to eq 'not_yet'
    end
  end
end
