class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  # before_action :move_to_index

  # def home
  #   @furimas = Furima.all
  # end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def comment_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def create
    @items = Items.new(items_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  # def user_params
  #   params.require(:user).permit(:name, :email)
  # end

end
