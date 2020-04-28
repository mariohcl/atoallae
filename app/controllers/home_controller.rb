class HomeController < ApplicationController
  skip_authorization_check

  def index
    @products = Product.all.limit(4).order("RANDOM()")
  end
end
