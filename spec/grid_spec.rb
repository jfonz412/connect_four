require 'grid'

describe Grid do

  context "upon initialization" do
  	context "when .make_grid is called" do
      it "creates an array" do
        expect(subject.slots).to be_a(Array)
      end
      it "creates a 7x6 multidimensional array" do
        expect(subject.slots[5][6]).to eql(" ")
      end
    end
  end
  
  let(:non_existant_slot0)  {   9 }
  let(:non_existant_slot1)  {  -1 }
  let(:non_existant_slot2)  { 1.3 }
  let(:non_existant_slot3)  { 'a' }
  let(:non_existant_slot4)  {  "" }
  let(:piece) { "\u{26aa}" }

  describe ".update_grid" do

  	context "given non-existant space" do
  	  it "returns false" do
  	  	expect(subject.update_grid(non_existant_slot0,piece)).to be false
  	  	expect(subject.update_grid(non_existant_slot1,piece)).to be false
  	  	expect(subject.update_grid(non_existant_slot2,piece)).to be false
  	  	expect(subject.update_grid(non_existant_slot3,piece)).to be false
  	  	expect(subject.update_grid(non_existant_slot4,piece)).to be false
  	  end
  	end

  	context "given an existing space" do
  	  it "returns true" do
  	  	expect(subject.update_grid(4,piece)).to be true
  	  	expect(subject.update_grid(1,piece)).to be true
  	  	expect(subject.update_grid(7,piece)).to be true
  	  end
  	end

  	context "given an available space" do
  	  it "updates the grid" do
  	  	expect(subject.update_grid(4,piece)).to be true
  	  	expect(subject.slots[5][3]).to eql("\u{26aa}")

  	  	expect(subject.update_grid(1,piece)).to be true
  	  	expect(subject.slots[5][0]).to eql("\u{26aa}")

  	  	expect(subject.update_grid(1,piece)).to be true
  	  	expect(subject.slots[4][0]).to eql("\u{26aa}")

  	  	expect(subject.slots[3][0]).to eql(" ")
  	  end
  	end
  end
end