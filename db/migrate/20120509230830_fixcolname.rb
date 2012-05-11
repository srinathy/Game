class Fixcolname < ActiveRecord::Migration
  def up
    rename_column :items, :cart_id, :basket_id
  end

  def down
  end
end
