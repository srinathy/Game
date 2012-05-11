class CombineItemsInBasket < ActiveRecord::Migration
  def up
    Basket.all.each do |basket|
      sums = basket.items.group(:product_id).sum(:quantity)
      sums.each do |product_id, quantity|
        if quantity > 1
          basket.items.where(:product_id => product_id).delete_all
          basket.items.build(:product_id => product_id, :quantity=>quantity)
        end
      end
    end
  end

  def down
  end
end
