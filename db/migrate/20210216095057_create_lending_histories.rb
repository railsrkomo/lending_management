class CreateLendingHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :lending_histories do |t|
      t.date :lending_at
      t.date :return_at
      t.string :lending_name
      # t.references :lender, null: false, foreign_key: true
      # t.references :borrower, null: false, foreign_key: true
      t.references :lender, null: false
      t.references :borrower, null: false

      t.timestamps
    end
  end
end
