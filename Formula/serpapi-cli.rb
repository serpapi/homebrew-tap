class SerpapiCli < Formula
  desc "HTTP client for structured web search data via SerpApi"
  homepage "https://serpapi.com"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpapi/serpapi-cli/releases/download/v0.4.0/serpapi_0.4.0_darwin_arm64.tar.gz"
      sha256 "0d84556ac2a10e9b65c20a623096621593ca943325f562dc3de8dd2736421421"
    else
      url "https://github.com/serpapi/serpapi-cli/releases/download/v0.4.0/serpapi_0.4.0_darwin_amd64.tar.gz"
      sha256 "510607509a8e634b26ce0e282624debde1c4a2bceb4bb1973ce4616e8b6872ed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpapi/serpapi-cli/releases/download/v0.4.0/serpapi_0.4.0_linux_arm64.tar.gz"
      sha256 "e5ab736434241d55433df61aeae599921dfe2c3b52931c2922b1044aef55311a"
    else
      url "https://github.com/serpapi/serpapi-cli/releases/download/v0.4.0/serpapi_0.4.0_linux_amd64.tar.gz"
      sha256 "d9533eecb7d4e1345c710c8b9a107c9a181a2fddeb2e083be46f4c5e05c87df0"
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
