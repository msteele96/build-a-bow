class CreateBow < ActiveRecord::Migration[5.2]
  def change
    create_table :bows do |t|
      t.string :name
      t.string :arrow_rest
      t.string :arrow_head
      t.string :arrow_shaft
      t.string :front_sight
      t.string :peep_sight
      t.string :model
      t.string :quiver
      t.string :release
      t.string :stabilizer
      t.integer :user_id
    end
  end
end
