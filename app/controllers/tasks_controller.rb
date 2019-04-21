class TasksController < ApplicationController
  before_action :set_list

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.list_id = params[:list_id]
    task.save
    redirect_to user_list_task_path(current_user, @list, task.id)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    redirect_to user_list_task_path(current_user, @list, task.id)
  end

  def destroy
    task = Task.find(params[:id])
    task.delete
    redirect_to user_list_path(current_user, @list.id)
  end

  private

  def set_list 
    @list = List.find(params[:list_id])
  end

  def task_params
    params.require(:task).permit(:user_id, :task_name, :description)
  end

end