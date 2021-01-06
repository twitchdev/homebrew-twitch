class TwitchCli < Formula
  desc "CLI for Twitch's developer offerings"
  homepage "https://github.com/twitchdev/twitch-cli"
  url "https://github.com/twitchdev/twitch-cli/archive/0.2.1.tar.gz"
  sha256 "31fd247260d78735ab9e8d7e52c994eed3d17907102f556c7945c1498bef86f7"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/twitchdev/homebrew-twitch/releases/download/twitch-cli-0.2.1"
    cellar :any_skip_relocation
    sha256 "a945242d56339c3ad00ac57a2f4aa15516bdc150b6ebb504d249d13687dd7b42" => :catalina
    sha256 "28584800ba1c25af97b05612792e9ea2217034b9e6d3c983cd31dee2ff58c343" => :x86_64_linux
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
