class TasksController < ApplicationController
  before_action :set_tasks, only: [:show, :edit, :update, :destroy] #! not to repeat several time set_task method

  def index
    @tasks = Task.all
  end

  def show
  end
  
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit  
  end 

  def update
    @task.update(update_task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def set_tasks
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details)
  end

  def update_task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
