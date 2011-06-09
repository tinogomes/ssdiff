require "spec_helper"

describe Super::Stupid::Diff do
  it "should result diff for different objects" do
    Object.ssdiff([1], "1").should == [[1], "1"]
  end

  it "should raise when compare objects without - method" do
    expect {
      Object.ssdiff(Object.new, Object.new)
    }.to raise_error(NoMethodError)
  end

  it "should result diff for arrays ['a'] and ['b']" do
    Object.ssdiff(%w(a), %w(b)).should == ["a" ,"b"]
  end

  it "should result diff for arrays ['a', 'b'] and ['b']" do
    Object.ssdiff(%w(a b), %w(b)).should == ["a"]
  end

  it "should result diff for arrays ['a'] and ['b', 'a']" do
    Object.ssdiff(%w(a), %w(b a)).should == ["b"]
  end

  it "should result not diff for same arrays" do
    Object.ssdiff(%w(a b c def), %w(a b c def)).should == []
  end

  it "should result diff for strings 'a' and 'b'" do
    Object.ssdiff(%(a), %(b)).should == ["a", "b"]
  end

  it "should result diff for strings 'ab' and 'a'" do
    Object.ssdiff(%(ab), %(a)).should == ["ab", "a"]
  end

  it "should result not diff for same strings" do
    Object.ssdiff("same", "same").should == []
  end

  it "should result diff for hashes with difference on keys" do
    Object.ssdiff({:a => 1}, {:b => 1}).should == [[:a, 1], [:b, 1]]
  end

  it "should result diff for hashes with difference on values" do
    Object.ssdiff({:a => 1}, {:a => 2}).should == [[:a, 1], [:a, 2]]
  end

  it "should result diff for hashes" do
    Object.ssdiff({:a => 1, :b => 2}, {:a => 1}).should == [[:b, 2]]
  end

  it "should result not diff for same hases" do
    Object.ssdiff({:a => 1, :b => 2}, {:b => 2, :a => 1}).should == []
  end

  it "should result diff self with other" do
    "a".ssdiff("b").should == ["a", "b"]
  end 
end

