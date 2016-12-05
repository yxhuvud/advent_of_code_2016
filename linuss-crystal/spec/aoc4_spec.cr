require "./spec_helper"

describe AoC4 do
  it "handles simple case" do
    AoC4.new("aaaaa-bbb-z-y-x-123[abxyz]").valid?.should be_true
    AoC4.new("a-b-c-d-e-f-g-h-987[abcde]").valid?.should be_true
    AoC4.new("not-a-real-room-404[oarel]").valid?.should be_true
    AoC4.new("totally-real-room-200[decoy]").valid?.should be_false

  end
end
