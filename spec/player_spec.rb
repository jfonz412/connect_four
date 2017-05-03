require 'player'

describe Player do
  
  subject do
  	Player.new("name","\u{26aa}")
  end

  context "when initialized" do
    it "assigns name and piece to player" do
      expect(subject.name).to eql("name")
      expect(subject.piece).to eql("\u{26aa}")  
    end
  end

end

