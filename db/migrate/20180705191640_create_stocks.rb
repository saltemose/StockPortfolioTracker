class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |s|
      s.string :name
      s.string :symbol
      s.integer :purchase_price
    end 
  end
end
