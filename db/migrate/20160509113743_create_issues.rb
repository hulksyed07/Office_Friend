class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.text :description
      t.integer :asker_id
      t.integer :technology_id
      t.boolean :is_solved
      t.boolean :archived

      t.timestamps
    end
  end
end
