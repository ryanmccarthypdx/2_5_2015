require 'spec_helper'

describe(Word) do

  it { should have_and_belong_to_many (:letters) }

  describe('#populate') do
    it("populates the join table with letter ids") do
      word = Word.create({ :name => "b"})
      word.populate
      expect(word.letters).to(eq([Letter.find_by_name("b")]))
    end
  end

  describe('#vanna_white') do
    it("returns all blanks if you vanna white a failure") do
      word = Word.create({:name => "attack"})
      word.populate
      expect(word.vanna_white("n")).to(eq("______"))
    end
    it("returns an array of the locations of a") do
      word = Word.create({:name => "attack"})
      word.populate
      expect(word.vanna_white("a")).to(eq("a__a__"))
    end
  end



end
