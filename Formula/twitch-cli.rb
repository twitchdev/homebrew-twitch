# typed: false
# frozen_string_literal: true
# This file was generated by GoReleaser. DO NOT EDIT.
class TwitchCli < Formula
  desc "CLI for Twitch's developer offerings"
  homepage "https://github.com/twitchdev/twitch-cli"
  version "1.0.0"
  license "Apache-2.0"
  bottle :unneeded
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/twitchdev/twitch-cli/releases/download/1.0.0/twitch-cli_1.0.0_Darwin_x86_64.tar.gz"
    sha256 "c6fc3c6663ba08b04276bc87efe3c20acb6cb816bf55933bc24137b289294a84"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/twitchdev/twitch-cli/releases/download/1.0.0/twitch-cli_1.0.0_Linux_x86_64.tar.gz"
    sha256 "e01d3511e7b604e52abc6879bb0148d7f066fa64dea8a011f37df6309024ac6e"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/twitchdev/twitch-cli.git", :branch => "main"
    depends_on "go" => :build
  end
  head "https://github.com/twitchdev/twitch-cli.git", :branch => "main"
  head do
    depends_on "go" => :build
  end
  def install
    v = version
    if build.head?
      v = "head"
      ldflags = "-X main.buildVersion=#{v}"
      system "go", "build", "-ldflags=#{ldflags}"
      system "mv", "twitch-cli", "twitch"
    end
    if OS.mac? && Hardware::CPU.arm?
      ldflags = "-X main.buildVersion=#{v}"
      system "go", "build", "-ldflags=#{ldflags}"
      system "mv", "twitch-cli", "twitch"
    end
    bin.install "twitch"
  end
  test do
    system "#{bin}/twitch", "-v"
  end
end