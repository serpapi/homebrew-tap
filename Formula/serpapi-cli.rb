class SerpapiCli < Formula
  desc "HTTP client for structured web search data via SerpApi"
  homepage "https://github.com/serpapi/serpapi-cli"
  url "https://github.com/serpapi/serpapi-cli/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "b4dcdb65570b427aaa8f3be4daad83dcb9d0d6103f1f5991ee5f0de826f5af95"
  license "MIT"
  head "https://github.com/serpapi/serpapi-cli.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = %W[-s -w -X github.com/serpapi/serpapi-cli/pkg/version.Version=#{version}]
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/serpapi"
  end

  test do
    assert_match "organic_results", shell_output("#{bin}/serpapi search q=coffee")
    assert_match "Invalid API key", shell_output("#{bin}/serpapi --api-key invalid search q=coffee 2>&1", 1)
    assert_match "No API key found", shell_output("#{bin}/serpapi account 2>&1", 2)
    assert_match "Invalid API key", shell_output("#{bin}/serpapi --api-key invalid account 2>&1", 1)
    assert_match "canonical_name", shell_output("#{bin}/serpapi locations q=Austin")
    assert_match "No API key found", shell_output("#{bin}/serpapi archive abc123 2>&1", 2)
    assert_match "api_error", shell_output("#{bin}/serpapi --api-key invalid archive abc123 2>&1", 1)
  end
end
