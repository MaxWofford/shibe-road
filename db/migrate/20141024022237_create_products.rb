class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text     :description
      t.string   :name
      t.string   :public_address

      t.timestamps
    end
  end
end
