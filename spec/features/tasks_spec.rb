require 'rails_helper'

RSpec.feature "Tasks機能", type: :feature do
  context 'タスクの一覧表示' do
    background do
      %w(firstTask secondTask LastTask).each do |title|
        create(:task, title: title)
      end
    end

    scenario '作成順に並んでいること' do
      visit tasks_path
      tasks = page.all(".task")
      expect(tasks[0].find('.task__title').text).to eq 'LastTask'
    end
  end

  scenario 'タスクを作成する' do
    visit new_task_path

    fill_in 'task[title]', with: 'Buy Milk'
    fill_in 'task[description]', with: 'Breakfast for tomorrow'

    click_on 'Create New Task'
    expect(page).to have_content I18n.t('flash.success.create', model: Task.model_name.human)
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

    expect(page).to have_content I18n.t('flash.success.update', model: Task.model_name.human)
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
    expect(page).to have_content I18n.t('flash.success.destroy', model: Task.model_name.human)
    # task が表示されていない
    expect(page).to_not have_content(task.title)
  end
end
