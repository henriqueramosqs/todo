class ListsController < ApplicationController
  def index
    @list = List.new
  end

  def show
    @list = List.find_by(name: params[:name])
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
