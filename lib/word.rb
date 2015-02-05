class Word < ActiveRecord::Base
  has_and_belongs_to_many :letters

  def populate
    array = self.name.split("")
    array.each do |letter|
      letter = Letter.find_by(name: letter)
      self.letters << letter
    end
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
  end



end
