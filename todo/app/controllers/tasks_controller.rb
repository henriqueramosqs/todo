
class TasksController < ApplicationController
    def create
      @list = List.find_by(name: params[:name])
      Rails.logger.debug("AAA name: #{params[:name]}")
      Rails.logger.debug("Params: #{params.inspect}")

      @task = @list.tasks.new(task_params)
      @task.done = false

      Rails.logger.debug("AAA task: #{@task}")
      if @task.save
        Rails.logger.debug("DEU BOM")
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
      Rails.logger.debug("Params: #{params.inspect}")
      Rails.logger.debug("Params EEEE: #{params["[task]"]}")
      params.require("[task]").permit(:description)
    end
  end