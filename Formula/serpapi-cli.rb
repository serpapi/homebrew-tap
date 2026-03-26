class SerpapiCli < Formula
  desc "CLI client for SerpApi — fast search scraping for humans and AI agents"
  homepage "https://serpapi.com"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/serpapi/serpapi-cli/releases/download/v#{version}/serpapi-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "FILL_IN_AFTER_FIRST_RELEASE"
    end
    on_intel do
      url "https://github.com/serpapi/serpapi-cli/releases/download/v#{version}/serpapi-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "FILL_IN_AFTER_FIRST_RELEASE"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/serpapi/serpapi-cli/releases/download/v#{version}/serpapi-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "FILL_IN_AFTER_FIRST_RELEASE"
    end
    on_intel do
      url "https://github.com/serpapi/serpapi-cli/releases/download/v#{version}/serpapi-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "FILL_IN_AFTER_FIRST_RELEASE"
    end
  end

  def install
    bin.install "serpapi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/serpapi --version")
  end
end
