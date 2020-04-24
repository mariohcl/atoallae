class HomeController < ApplicationController
  def index
    @products = Product.all.limit(4).order("RANDOM()")
  end
end
