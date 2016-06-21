class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :name
      t.string :body
      t.references :board, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
