class PagesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def home
    @furimas = Furima.all
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
end
