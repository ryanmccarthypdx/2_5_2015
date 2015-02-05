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
    it("returns empty array if the letter ain't in there") do
      word = Word.create({:name => "attack"})
      word.populate
      expect(word.vanna_white("n")).to(eq([]))
    end
    it("returns an array of the locations of a") do
      word = Word.create({:name => "attack"})
      word.populate
      expect(word.vanna_white("a")).to(eq([0,3]))
    end
  end


end
