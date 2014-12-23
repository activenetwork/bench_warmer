require "bench_warmer/version"
require "httparty"
require "benchmark"

module BenchWarmer
  class Url
    include Benchmark

    def self.run(endpoint:, run_times: 10)
      endpoint = form_url(endpoint)
      label_width = 10
      benches = []
      Benchmark.benchmark(CAPTION, label_width, FORMAT, "\nTotal:", "Average:") do |bench|
        response = nil
        benches.push bench.report("first pass")  { response = HTTParty.get(endpoint) }
        if response.code == 200
          run_times.to_i.times do
            benches.push bench.report("next pass") { response = HTTParty.get(endpoint) }
          end
        else
          puts "Error: Status #{response.code} for #{endpoint}"
        end
        [benches.reduce(:+), (benches.reduce(:+) / benches.size)]
      end
    end

    def self.form_url(user_url)
      if user_url.start_with? 'http'
        user_url
      else
        "http://#{user_url}"
      end
    end
  end
end
