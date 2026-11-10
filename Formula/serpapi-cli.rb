class SerpapiCli < Formula
  desc "HTTP client for structured web search data via SerpApi"
  homepage "https://serpapi.com"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpapi/serpapi-cli/releases/download/v0.5.1/serpapi_0.5.1_darwin_arm64.tar.gz"
      sha256 "eb6b4f2f3e55825587eca567501b786c13e7f785e71939123d0453dd8e909c95"
    else
      url "https://github.com/serpapi/serpapi-cli/releases/download/v0.5.1/serpapi_0.5.1_darwin_amd64.tar.gz"
      sha256 "c45eca7d655b09038499b17ba0d1a7af7a766dc98d5b030ab7fb481e46b1e8ba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpapi/serpapi-cli/releases/download/v0.5.1/serpapi_0.5.1_linux_arm64.tar.gz"
      sha256 "41bf93663754f481de3aac1381cedb4eef1e4c750026a910552b2faa4e47471e"
    else
      url "https://github.com/serpapi/serpapi-cli/releases/download/v0.5.1/serpapi_0.5.1_linux_amd64.tar.gz"
      sha256 "cbac1ddb672cbcd1070d27363855c84cc80979a4870057589d5249db3adc6ef2"
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
