class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    if task.save
      flash[:success] = 'Success! Create new Task!'
      redirect_to tasks_path
    else
      # message
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    if task.update_attributes(task_params)
      flash[:success] = 'Success! Update Task!'
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy!
    flash[:warning] = 'Success! Deleted Task!'
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due, :status)
  end
end
