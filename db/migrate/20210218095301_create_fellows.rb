class CreateFellows < ActiveRecord::Migration[6.0]
  def change
    create_table :fellows do |t|
      # t.references :friend, null: false, foreign_key: true
      # t.references :own, null: false, foreign_key: true
      t.references :friend, null: false
      t.references :user, null: false
      t.text :reason_of
      t.date :relation_since

      t.timestamps
    end
  end
end
