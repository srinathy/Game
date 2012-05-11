class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  helper_method :current_basket
  helper_method :basket_empty?
  helper_method :total_price
  helper_method :total_items
  
  private
  
  def current_basket
    @current_basket = Basket.find(session[:basket_id])
    rescue ActiveRecord::RecordNotFound
      @current_basket = Basket.create
      session[:basket_id] = @current_basket.id
    @current_basket
  end
  
  def basket_empty?
    @current_basket.nil?   
  end
  def total_price
    total_cost = 0
      @current_basket.items.each do |item|      
        total_cost += item.product.price*item.quantity
      end
      total_cost
  end
  
  def total_items
    @current_basket = current_basket
    total_count = 0
    @current_basket.items.each do |item|      
      total_count += item.quantity
    end
    total_count
  end
end
