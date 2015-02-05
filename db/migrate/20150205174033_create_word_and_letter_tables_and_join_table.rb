class CreateWordAndLetterTablesAndJoinTable < ActiveRecord::Migration
  def change
    create_table(:words) do |t|
      t.string :name
    end
    create_table :letters do |t|
      t.string :name
    end
    create_table :letters_words do |t|
      t.integer :word_id
      t.integer :letter_id
    end    
  end
end
