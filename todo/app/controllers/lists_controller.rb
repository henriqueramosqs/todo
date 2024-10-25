  class ListsController < ApplicationController
    def index
      if params[:name].present?
        redirect_to list_path(params[:name])
      else
        @list = List.new
      end
    end

    def show
      @list = List.find_by(name: params[:name])
      Rails.logger.debug("AAA list: #{params[:name]}")
      @todo_tasks = @list.tasks.todos
      @completed_tasks = @list.tasks.completed
    end

    def create
      @list = List.new(list_params)
      if @list.save
        redirect_to list_path(@list.name)
      else
        render :index
      end
    end

    private

    def list_params
      params.require(:list).permit(:name)
    end
  end
