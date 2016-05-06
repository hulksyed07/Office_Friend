class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :pool
      t.string :location
      t.string :contact
      t.text :about_me

      t.timestamps
    end
  end
end
