class AddPartialWordColumn < ActiveRecord::Migration
  def change
    add_column(:words, :partial_word, :string)
  end
end
