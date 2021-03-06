class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string       :name,            null: false
      t.text         :introduction,    null: false
      t.integer      :brand
      t.references   :category,        null: false, foreign_key: true
      t.integer      :condition,       null: false
      t.integer      :area_id,         null: false
      t.integer      :size
      t.integer      :price,           null: false
      t.integer      :preparation_day, null: false
      t.integer      :postage,         null: false
      t.references   :seller,          null: false, foreign_key: { to_table: :users }
      t.references   :buyer ,                       foreign_key: { to_table: :users }
      t.integer      :status,          null: false, default: 0
      t.timestamps
    end
  end
end
