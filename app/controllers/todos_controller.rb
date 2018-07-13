class TodosController < ApplicationController
    # method 1:
    #before_action :target_todo, :only => [:show, :edit, :update, :destroy, :done]
    # method 2:
    before_action :target_todo, :only => [:show, :edit, :update, :destroy, :is_done]
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to todos_path
    else
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @todo.update_attributes(todo_params)
      redirect_to todos_path
    else
      render :action => :edit
    end
  end

  def show
  end

  def destroy
    @todo.destroy
    redirect_to todos_path
  end

  # method 1:
   #def done 
  # method 2:用member do ,連同route.rb一起改
  def is_done
    @todo.is_done = !(@todo.is_done)
    @todo.save
    redirect_to todos_path
    #render :action => :index
  end

  private
  def todo_params
    params.require(:todo).permit(:name, :due_date, :note)
  end

  def target_todo
    @todo = Todo.find(params[:id])
  end
end