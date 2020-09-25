class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
    t.bigint :user_id,       null: false, foreign_key: true
    t.references :furima,    null: false, foreign_key: true
    t.timestamps
    end
  end
end
