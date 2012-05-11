class ItemsController < ApplicationController
  
  def create  
    @basket = current_basket
    product = Product.find(params[:product_id])
    current_item = @basket.items.find_by_product_id(product.id)
    if (current_item.nil?)
      @item = @basket.items.build(:product_id => product.id)  
      respond_to do |format|
        if @item.save
          format.html { redirect_to @item.basket,
          notice: 'Item was successfully created.' }
          format.json { render json: @item,
          status: :created, location: @item }
        else
          format.html { render action: "new" }
          format.json { render json: @item.errors,
          status: :unprocessable_entity }
        end
      end    
    else
      current_item.quantity += 1
      current_item.save
      redirect_to @basket 
    end
  end
  
  def destroy
    basket = current_basket
    basket.destroy
    session[:basket_id] = nil
    redirect_to root_path
  end
  
  
end  
