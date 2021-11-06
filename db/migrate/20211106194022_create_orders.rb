class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      # page one
      t.string :full_name
      t.string :name

      # page two
      t.integer :size

      # page three
      t.string :topping

      # optional page four
      t.string :bonus_side_dish

      # used by wizardry
      t.uuid :identifier
      t.boolean :complete
      t.string :last_completed_step

      # rails stuff
      t.timestamps
    end
  end
end
