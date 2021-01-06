class TwitchCli < Formula
  desc "CLI for Twitch's developer offerings"
  homepage "https://github.com/twitchdev/twitch-cli"
  url "https://github.com/twitchdev/twitch-cli/archive/0.2.0.tar.gz"
  sha256 "264acaaa258fd7b82da471ad240d90421bb762860430ddf77846e9cff43b2e02"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/twitchdev/homebrew-twitch/releases/download/twitch-cli-0.1.0"
    cellar :any_skip_relocation
    sha256 "63c018e76da21a6736c18b23877b1edf35edfef6c8d90b7fc2fcef5e894efd73" => :catalina
    sha256 "7797ffe0e14bdd1e249136e2e670ae0a91c08417463ae88102622302d0a54b26" => :x86_64_linux
  end

  depends_on "go" => :build

  def install
    ldflags = "-X main.buildVersion=#{version}"
    system "go", "build", "-ldflags=#{ldflags}"
    bin.install "twitch-cli" => "twitch"
  end

  test do
    system "#{bin}/twitch", "version"
  end
end
