class ApplicationController < ActionController::Base
  def index
    @all_tasks = Task.all
  end

  def show
    @current_task = Task.find(params[:id])
    @message = @current_task.completed ? "Task completed" : "You haven't completed this task"
  end

  def new

  end
end
