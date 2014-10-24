class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer  :price
      t.string   :name
      t.string   :token
      t.string   :public_address
      t.text     :description

      t.timestamps
    end
  end
end
