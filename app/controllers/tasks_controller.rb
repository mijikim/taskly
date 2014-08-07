class TasksController < ApplicationController

  def index
    @tasks = Task.order(:name)
  end
  
  def new
    @task = Task.new
    @task_list = TaskList.find(params[:task_list_id])
  end
  
  def create
    @task_list = TaskList.find(params[:task_list_id])
    @task = Task.new(task_name: params[:task][:task_name], due_date: Date.new(params[:task]["due_date(1i)"].to_i, params[:task]["due_date(2i)"].to_i, params[:task]["due_date(3i)"].to_i), task_list_id: params[:task_list_id])
    if @task.save
      flash[:notice] = "Task was created successfully!"
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @task_lists = TaskList.find(params[:task_list_id])
    @task = Task.find(params[:id])
    @task.update(completed?: 1)
      redirect_to root_path
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task_list = TaskList.find(params[:task_list_id])
    @task.destroy
    flash[:notice] = "Task List was deleted successfully!"
    redirect_to root_path
  end

end