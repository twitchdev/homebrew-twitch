class TwitchCli < Formula
  desc "CLI for Twitch's developer offerings"
  homepage "https://github.com/twitchdev/twitch-cli"
  url "https://github.com/twitchdev/twitch-cli/archive/0.2.0.tar.gz"
  sha256 "264acaaa258fd7b82da471ad240d90421bb762860430ddf77846e9cff43b2e02"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/twitchdev/homebrew-twitch/releases/download/twitch-cli-0.2.0"
    cellar :any_skip_relocation
    sha256 "12473d344269a77cdb6f1b608d25167366675332b67de9cc4f6788d87919acc0" => :catalina
    sha256 "048c1d66a51aed8e959c6cc2804dbb9a50f52ab700b7e56e4cdaf0cb4fe62c86" => :x86_64_linux
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
