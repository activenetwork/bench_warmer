require 'bench_warmer'

module BenchWarmer
  describe Url do
    it "should not add http if already has it" do
      expect(Url.form_url("http://www.google.com")).to eq "http://www.google.com"
    end
    it "should add http if already has it" do
      expect(Url.form_url("www.google.com")).to eq "http://www.google.com"
    end
  end
end
