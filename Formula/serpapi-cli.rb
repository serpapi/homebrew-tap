class SerpapiCli < Formula
  desc "CLI client for SerpApi — fast search scraping for humans and AI agents"
  homepage "https://serpapi.com"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/serpapi/serpapi-cli/releases/download/v#{version}/serpapi-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "4e5447dcba96a7bcae51cb3c872159e982311f649e7229f64b735307db0a57f2"
    end
    on_intel do
      url "https://github.com/serpapi/serpapi-cli/releases/download/v#{version}/serpapi-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "daafa551c0d0edbd4540f587f150b397ce03d44fea7ff58974828f983efaa19c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/serpapi/serpapi-cli/releases/download/v#{version}/serpapi-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "70fdd1b0d4e584959136b4544583b066aac1cd8e6f078ccc24ee0d61f6ac000e"
    end
    on_intel do
      url "https://github.com/serpapi/serpapi-cli/releases/download/v#{version}/serpapi-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "23e49187d7478357db9ccb3bd2cca05b9961a74fd5b2ba6379798314ab88f02f"
    end
  end

  def install
    bin.install "serpapi"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/serpapi --version")
  end
end
