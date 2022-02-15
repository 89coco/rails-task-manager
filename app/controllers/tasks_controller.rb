class TasksController < ApplicationController
  before_action :find, only: [:show, :edit, :update, :destroy]

  def new
    @task = Task.new # needed to instantiate the form_for
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def index
    @tasks = Task.all
  end

  def show
    # will just find the restaurant to show
  end

  def edit
    # will just find the restaurant to edit
  end

  def update
    @task.update(task_params)
    @task.save
    redirect_to tasks_path(@task)
  end

  def destroy
    @task.delete
    redirect_to tasks_path
  end

  private

  def find
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
