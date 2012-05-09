class AddImageAndCertificateAndreleasedateToProduct < ActiveRecord::Migration
  def change
    add_column :products, :image, :string

    add_column :products, :certificate, :string

    add_column :products, :releasedate, :date

  end
end
