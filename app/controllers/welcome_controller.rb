class WelcomeController < ApplicationController
  before_action :load_data, only: [:index, :brand]

  def index
    @products = Product.all
  end

  def brand
    @products = Product.where(brand_id: params[:brand_id])
    render 'index'
  end

protected

  def load_data
    @brands = Brand.all
    @categories = Category.all
  end

end
