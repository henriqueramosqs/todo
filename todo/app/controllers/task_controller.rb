class TasksController < ApplicationController
  def create
    @list = List.find(params[:task][:list_id])
    @task = @list.tasks.new(task_params)
    @task.done = false
    if @task.save
      redirect_to list_path(@list.name)
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update(done: !@task.done)
    redirect_to list_path(@task.list.name)
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end
end
