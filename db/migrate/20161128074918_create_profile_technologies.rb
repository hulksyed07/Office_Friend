class CreateProfileTechnologies < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_technologies, :id => false do |t|
      t.references :profile, foreign_key: true
      t.references :technology, foreign_key: true
    end
  end
end
