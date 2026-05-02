class CreateCards < ActiveRecord::Migration[7.2]
  def change
    create_table :cards do |t|
      t.references :deck, null: false, foreign_key: true
      t.text :front
      t.text :back
      t.integer :confidence
      t.datetime :last_reviewed

      t.timestamps
    end
  end
end
