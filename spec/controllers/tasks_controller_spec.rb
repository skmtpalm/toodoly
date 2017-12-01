require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let!(:tasks) do
    %w(FirstTask SecondTask ThirdTask).map do |title|
      create(:task, title: title)
    end
  end

  context 'GET#index' do
    it 'レスポンス成功' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it '@tasks に適切に task が割り当てられていること(作成順)' do
      get :index
      expect(assigns(:tasks)).to match(
        [
          tasks[2],
          tasks[1],
          tasks[0]
        ]
      )
    end
  end

  context 'GET#new' do
    it 'レスポンス成功' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  context 'GET#edit' do
    it 'レスポンス成功' do
      get :edit, params: { id: tasks[0].id }
      expect(response).to have_http_status(:success)
    end
  end

  context 'POST#create' do
    context '成功' do
      it 'レスポンス成功' do
        post :create, params: { task: {title: 'hello'} }
        expect(response).to have_http_status(302)
      end

      it 'task の数が増えていること' do
        post :create, params: { task: {title: 'hello again'} }
        expect(Task.count).to eq tasks.size + 1
      end

      it 'タスク一覧ページへリダイレクトされること' do
        post :create, params: { task: {title: 'hello'} }
        expect(response).to redirect_to(tasks_path)
      end
    end

    context '失敗' do
      it 'new ページが表示されること' do
        post :create, params: { task: {title: ''} }
        expect(response).to render_template(:new)
      end
    end
  end

  context 'PATCH#update' do
    context '成功' do
      it '属性が更新されていること' do
        task = tasks[0]
        new_title = 'new task'
        new_desc = 'new desc'
        patch :update, params: { id: task.id, task: { title: new_title, description: new_desc }}
        task.reload

        expect(task.title).to eq new_title
        expect(task.description).to eq new_desc
      end
    end

    context '失敗' do
      it 'エディトページが表示される' do
        patch :update, params: { id: tasks[0].id, task: { title: '' } }
        expect(response).to render_template :edit
      end
    end
  end
end
