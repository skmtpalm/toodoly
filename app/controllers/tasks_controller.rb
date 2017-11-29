class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    binding.pry
    if task.save
      # message
      redirect_to tasks_path
    else
      # message
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due, :status)
  end
end
