class AddMnemonicToWords < ActiveRecord::Migration[5.0]
  def change
  	add_column :words, :mnemonic, :string
  end
end
