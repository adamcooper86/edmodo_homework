class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :assignment_id
      t.string :answer

      t.timestamps null: false
    end
  end
end
