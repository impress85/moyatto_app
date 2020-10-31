class CreateMoyattos < ActiveRecord::Migration[6.0]
  def change
    create_table :moyattos do |t|
      t.text :want  , null: false
      t.text :cannot, null: false
      t.text :status, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
