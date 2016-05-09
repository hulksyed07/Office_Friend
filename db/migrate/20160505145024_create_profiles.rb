class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.references :user
      t.string :first_name
      t.string :last_name
      t.string :pool
      t.string :location
      t.string :contact
      t.references :role
      t.text :about_me

      t.timestamps
    end
  end
end
