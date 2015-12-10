class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.string :title
      t.string :question
      t.date :due

      t.timestamps null: false
    end
  end
end
