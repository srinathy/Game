class PagesController < ApplicationController
  
  def home
    @title = "Welcome to Game's Central!"
  end
  
  def search
    if params[:query] != ""
      @products = Product.search(params[:query])
    else
      @products = []
    end
  end
  
  def checkout
  end
  
end
