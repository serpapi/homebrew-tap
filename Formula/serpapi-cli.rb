class SerpapiCli < Formula
  desc "CLI client for SerpApi — fast search scraping for humans and AI agents"
  homepage "https://serpapi.com"
  url "https://github.com/serpapi/serpapi-cli/archive/refs/tags/v#{version}.tar.gz"
  sha256 "PLACEHOLDER_SHA256"
  license "MIT"
  head "https://github.com/serpapi/serpapi-cli.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/serpapi --version")
  end
end
