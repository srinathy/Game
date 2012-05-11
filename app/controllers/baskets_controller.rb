class BasketsController < ApplicationController
  def show
    @basket = Basket.find(params[:id])
    respond_to do |format|
      format.html 
      format.json { render json: @basket }
    end
  end
  
  def new
    @basket = Basket.new
    respond_to do |format|
      format.html
      format.json { render json: @basket }
    end
  end
  
  def create
    @title = "Your Basket"
    @basket = Basket.new(params[:basket])

    respond_to do |format|
      if @basket.save
        format.html { redirect_to @basket, notice: 'Basket was successfully created.' }
        format.json { render json: @basket, status: :created, location: @basket }
      else
        format.html { render action: "new" }
        format.json { render json: @basket.errors, status: :unprocessable_entity }
      end
    end
  end
end
