class TasksController < ApplicationController

  def index
    @all_tasks = Task.all
  end

  def new
    @new_task = Task.new
  end

  def show
    @current_task = Task.find(params[:id])
    @message = @current_task.completed ? "Task completed" : "You haven't completed this task"
  end

  def create
    @new_task = Task.new(task_params)
    @new_task.save
    redirect_to task_path(@new_task)
  end

  def edit
    @current_task = Task.find(params[:id])
  end

  def update
    @current_task = Task.find(params[:id])
    @current_task.update(task_params)
    # raise
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
