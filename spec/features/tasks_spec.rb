require 'rails_helper'

RSpec.feature "Tasks機能", type: :feature do

  scenario 'タスクを作成する' do
    visit new_task_path

    fill_in 'task[title]', with: 'Buy Milk'
    fill_in 'task[description]', with: 'Breakfast for tomorrow'

    click_on 'Create New Task'

    expect(page).to have_content 'Success!'
    expect(Task.count).to eq 1
    expect(Task.first.title).to eq 'Buy Milk'
  end

  scenario 'タスクを更新する' do
    task = build(:task)
    before_title = 'Go to Gym'
    task.title = before_title
    task.save!

    # index task page
    visit tasks_path
    # before title をもつ task が表示されている
    expect(page).to have_content(before_title)
    # task の編集画面へ
    visit edit_task_path(task)

    fill_in 'task[title]', with: 'Go to Home'
    click_on 'Update Task'

    expect(page).to have_content('Success! Update Task')
    expect(page).to have_content('Go to Home')
  end

  scenario 'タスク削除する' do
    task = build(:task)
    task.save!

    visit tasks_path
    # task があること
    expect(page).to have_content(task.title)
    # delete link をクリック
    click_on 'Delete Task'

    # 削除成功のメッセージがある
    expect(page).to have_content('Success! Deleted Task')
    # task が表示されていない
    expect(page).to_not have_content(task.title)
  end
end
