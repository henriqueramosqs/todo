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
      if(@list)
        @todo_tasks = @list.tasks.todos
        @completed_tasks = @list.tasks.completed
      else
        redirect_to root_path, alert: "Página não existente"
      end
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
