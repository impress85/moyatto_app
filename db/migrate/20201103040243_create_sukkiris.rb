class CreateSukkiris < ActiveRecord::Migration[6.0]
  def change
    create_table :sukkiris do |t|
      t.text :result, null: false
      # t.moyatto_status
      t.references :user, foreign_key: true
      t.references :guess, foreign_key: true
      t.timestamps
    end
  end
end
