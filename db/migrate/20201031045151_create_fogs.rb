class CreateFogs < ActiveRecord::Migration[6.0]
  def change
    create_table :fogs do |t|
      t.text :want
      t.text :cannot
      t.text :status
      t.timestamps
    end
  end
end
