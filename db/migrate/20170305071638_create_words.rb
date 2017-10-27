class CreateWords < ActiveRecord::Migration[5.0]
  def change
    create_table :words do |t|
      t.string :character
      t.string :meaning, index: true
      t.string :pinyin
      t.string :part_of_speech, index: true

      t.timestamps
    end
  end
end
