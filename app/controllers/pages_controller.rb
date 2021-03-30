class PagesController < ApplicationController
  # before_action :authenticate_user! この記述だと未ログイン時のトップページがログイン画面になる
  # before_action :move_to_index, except: [:index, :show]

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
