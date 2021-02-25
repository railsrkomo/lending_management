class CreateLendings < ActiveRecord::Migration[6.0]
  def change
    create_table :lendings do |t|
      t.string :name
      t.date :lending_at
      t.date :expected_return_at
      # t.references :lender, null: false, foreign_key: true
      # t.references :borrower, null: false, foreign_key: true
      t.references :lender, null: false
      t.references :borrower, null: false

      t.timestamps
    end
  end
end
