class Word < ActiveRecord::Base
  has_and_belongs_to_many :letters

  def populate
    array = self.name.split("")
    array_partial_word = []
    array.each do |letter|
      letter = Letter.find_by(name: letter)
      self.letters << letter
      array_partial_word.push("_")
    end
    self.update({ :partial_word => array_partial_word.join })
  end

  def vanna_white(target)
    counter = 0
    output_array = []
    self.name.split("").each do |letter|
      if letter == target
        output_array.push(counter)
      end
      counter += 1
    end
    output_array
    output_array.each do |found|
      array = self.partial_word.split("")
      array[found] = target
      self.update({ :partial_word => array.join })
    end
    self
  end



end
