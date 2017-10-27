class CreateWordsTesteds < ActiveRecord::Migration[5.0]
  def change
    create_table :words_testeds do |t|
      t.references :tests, foreign_key: true
      t.references :words, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
