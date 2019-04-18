class ListsController < ApplicationController

  def index
    @lists = current_user.lists
  end

  def show
    @user = User.find(params[:user_id])
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    list = List.new(list_params)
    list.user_id = params[:user_id]
    list.save
    redirect_to user_list_path(current_user, list.id)
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to user_list_path(current_user, list.id)
  end

  def destroy
    list = List.find(params[:id])
    list.delete
    redirect_to user_lists_path(current_user)
  end

  private

  def list_params
    params.require(:list).permit(:user_id, :list_name, :description)
  end

end