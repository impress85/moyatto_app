class CreateAdvices < ActiveRecord::Migration[6.0]
  def change
    create_table :advices do |t|
      t.text :comment ,null: false
      t.references :user, foreign_key: true
      t.references :moyatto, foreign_key: true
      t.timestamps
    end
  end
end
