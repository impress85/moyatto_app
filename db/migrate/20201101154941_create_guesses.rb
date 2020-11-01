class CreateGuesses < ActiveRecord::Migration[6.0]
  def change
    create_table :guesses do |t|
      t.text :story,null: false
      t.references :user, foreign_key: true
      t.references :moyatto, foreign_key: true
      t.timestamps
    end
  end
end
