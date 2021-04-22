class OrdersController < ApplicationController

  def index
    @form = Form.new
  end

  def create
    binding.pry
  end

end
