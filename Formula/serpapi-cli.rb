class SerpapiCli < Formula
  desc "HTTP client for structured web search data via SerpApi"
  homepage "https://github.com/serpapi/serpapi-cli"
  url "https://github.com/serpapi/serpapi-cli/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "b4dcdb65570b427aaa8f3be4daad83dcb9d0d6103f1f5991ee5f0de826f5af95"
  license "MIT"
  head "https://github.com/serpapi/serpapi-cli.git", branch: "main"

  depends_on "rust" => :build
  depends_on "openssl@3"

  def install
    ENV["OPENSSL_NO_VENDOR"] = "1"
    ENV["OPENSSL_DIR"] = Formula["openssl@3"].opt_prefix
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "organic_results", shell_output("#{bin}/serpapi search q=coffee")
    assert_match "Invalid API key", shell_output("#{bin}/serpapi --api-key invalid search q=coffee 2>&1", 1)
    assert_match "No API key found", shell_output("#{bin}/serpapi account 2>&1", 2)
    assert_match "Invalid API key", shell_output("#{bin}/serpapi --api-key invalid account 2>&1", 1)
    assert_match "canonical_name", shell_output("#{bin}/serpapi locations q=Austin")
    assert_match "No API key found", shell_output("#{bin}/serpapi archive abc123 2>&1", 2)
    assert_match "Invalid API key", shell_output("#{bin}/serpapi --api-key invalid archive abc123 2>&1", 1)
  end
end
