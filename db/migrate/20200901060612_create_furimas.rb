class CreateFurimas < ActiveRecord::Migration[6.0]
  def change
    create_table :furimas do |t|
      t.references :user,                null: false, foreign_key: true
      t.string     :name,                null: false
      t.text       :explanation,         null: false
      t.integer    :price,               null: false
      t.integer    :category_id,         null: false
      t.integer    :status_id,           null: false
      t.integer    :delivery_fee_id,     null: false
      t.integer    :area_id,             null: false
      t.integer    :delivery_day_id,     null: false
      t.timestamps
    end
  end
end
