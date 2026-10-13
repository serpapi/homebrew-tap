class SerpapiCli < Formula
  desc "HTTP client for structured web search data via SerpApi"
  homepage "https://serpapi.com"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpapi/serpapi-cli/releases/download/v0.3.0/serpapi_0.3.0_darwin_arm64.tar.gz"
      sha256 "d240e89bbd736ce4552131262d664c2c034162748aa7018a599d5dd1ba38ee1b"
    else
      url "https://github.com/serpapi/serpapi-cli/releases/download/v0.3.0/serpapi_0.3.0_darwin_amd64.tar.gz"
      sha256 "5117e919bfb5f8672268eda18765cdfd405edccc33cb730ee035803caa81c300"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpapi/serpapi-cli/releases/download/v0.3.0/serpapi_0.3.0_linux_arm64.tar.gz"
      sha256 "c837aa3186d6fb6d9b6b1e4ea689e0c6e1ec3c199270f1444866c27bc627d69c"
    else
      url "https://github.com/serpapi/serpapi-cli/releases/download/v0.3.0/serpapi_0.3.0_linux_amd64.tar.gz"
      sha256 "34c5f553cd55de6d0d6f203cea6f88f8ae6c57c52ab07d158c77a5a4c0ed5990"
    end
  end

  def install
    bin.install "serpapi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/serpapi --version")
    assert_match "search", shell_output("#{bin}/serpapi --help")
    assert_match "No API key", shell_output("#{bin}/serpapi account 2>&1", 2)
    assert_match "No API key", shell_output("#{bin}/serpapi archive abc123 2>&1", 2)
    assert_match "Invalid archive ID", shell_output("#{bin}/serpapi --api-key x archive ../bad 2>&1", 2)
  end
end
