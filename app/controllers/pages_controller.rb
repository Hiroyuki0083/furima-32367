class PagesController < ApplicationController
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

end
