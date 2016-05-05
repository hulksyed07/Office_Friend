class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :email
      t.string :pool
      t.string :location
      t.string :contact
      t.text :about_me

      t.timestamps
    end
  end
end
