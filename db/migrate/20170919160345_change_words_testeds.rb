class ChangeWordsTesteds < ActiveRecord::Migration[5.0]
  def change
  	rename_table :words_testeds, :words_tested
  end
end
