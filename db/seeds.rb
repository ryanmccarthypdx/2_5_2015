

letters = "abcdefghijklmnopqrstuvwxyz"
letters_array = letters.split("")
letters_array.each do |letter|
  Letter.create({ :name => letter })
end
