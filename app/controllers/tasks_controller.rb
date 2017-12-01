class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]

  def index
    @tasks = Task.new_available
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = @task.flash_success(:create)
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update_attributes(task_params)
      flash[:success] = @task.flash_success(:update)
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    @task.destroy!
    flash[:warning] = @task.flash_success(:destroy)
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :due, :status)
  end
end
