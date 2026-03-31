class SerpapiCli < Formula
  desc "HTTP client for structured web search data via SerpApi"
  homepage "https://serpapi.com"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpapi/serpapi-cli/releases/download/v0.2.3/serpapi_0.2.3_darwin_arm64.tar.gz"
      sha256 "ae55b34e62cc09dd75bfdb58852c88fb85d5e219cf7ba42f782c6f64697e1cf4"
    else
      url "https://github.com/serpapi/serpapi-cli/releases/download/v0.2.3/serpapi_0.2.3_darwin_amd64.tar.gz"
      sha256 "298b50d013508b8f002ae94a3c9c4a479722bec7394dc2ba2ce8a2600c6fad25"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpapi/serpapi-cli/releases/download/v0.2.3/serpapi_0.2.3_linux_arm64.tar.gz"
      sha256 "f85752bfef332a818d488a79629fcc8143501e759cbfb9571c6e370bf61e455f"
    else
      url "https://github.com/serpapi/serpapi-cli/releases/download/v0.2.3/serpapi_0.2.3_linux_amd64.tar.gz"
      sha256 "f6260c99150c93667ccef7824794142343a81de99f1605642a0ef163810e5535"
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
