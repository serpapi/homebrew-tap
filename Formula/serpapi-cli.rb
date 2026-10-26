class SerpapiCli < Formula
  desc "HTTP client for structured web search data via SerpApi"
  homepage "https://serpapi.com"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpapi/serpapi-cli/releases/download/v0.5.0/serpapi_0.5.0_darwin_arm64.tar.gz"
      sha256 "52e0fff866215d20a8b8f6b21cc71da524eed443d48af74fdef7f8d35004cb5b"
    else
      url "https://github.com/serpapi/serpapi-cli/releases/download/v0.5.0/serpapi_0.5.0_darwin_amd64.tar.gz"
      sha256 "eeecdef475d6bf4a25fe6cb5558783edf901cfa530e9e052682be910ecf21858"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpapi/serpapi-cli/releases/download/v0.5.0/serpapi_0.5.0_linux_arm64.tar.gz"
      sha256 "dd71e289f113912fbec0caffae43302e595fd0c31e47c401ad4c3ee37f147e56"
    else
      url "https://github.com/serpapi/serpapi-cli/releases/download/v0.5.0/serpapi_0.5.0_linux_amd64.tar.gz"
      sha256 "5ed775339c18feec9c1b489f335fede237601a4fe9eb0aa5a2224065f0c4ce82"
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
