class PagesController < ApplicationController
  def home
    @furimas = Furima.all
  end
end
