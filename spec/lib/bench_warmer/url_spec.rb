require 'bench_warmer'

module BenchWarmer
  describe Url do
    it "should not add http if already has it" do
      expect(Url.end_point("http://google.com")).to eq "http://www.google.com"
    end
    it "should  add http if already has it" do
      expect(Url.end_point("google.com")).to eq "http://www.google.com"
    end
  end
end
