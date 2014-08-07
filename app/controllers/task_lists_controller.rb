class TaskListsController < ApplicationController

  def index
    @task_lists = TaskList.order(:name)
  end

  def new
    @task_lists = TaskList.new
  end

  def show
    @task_lists = TaskList.find(params[:id])
  end

  def create
    @task_lists = TaskList.new(name: params[:task_list][:name])
    if @task_lists.save
      flash[:notice] = "Task List was created successfully!"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @task_lists = TaskList.find(params[:id])
  end

  def update
    @task_lists = TaskList.find(params[:id])
    if @task_lists.update(name: params[:task_list][:name])
      flash[:notice] = "Task List was updated successfully!"
      redirect_to root_path(@task_lists)
    else
      render :edit
    end
  end

end