# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class TwitchCli < Formula
  desc "CLI for Twitch's developer offerings"
  homepage "https://github.com/twitchdev/twitch-cli"
  version "1.0.2"
  license "Apache-2.0"
  bottle :unneeded

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/twitchdev/twitch-cli/releases/download/1.0.2/twitch-cli_1.0.2_Darwin_x86_64.tar.gz"
    sha256 "e25c08a9791bf2e70b153661dc04b65b5910b2a9e9089ff604398dcfbebc2c00"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/twitchdev/twitch-cli/releases/download/1.0.2/twitch-cli_1.0.2_Linux_x86_64.tar.gz"
    sha256 "62e8c30b012f09d86b3b22771c3c9b02eba520340a0d86f56cf2c37beff50992"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/twitchdev/twitch-cli.git", tag: "1.0.2"
    depends_on "go" => :build
  end

  head "https://github.com/twitchdev/twitch-cli.git", branch: "main"
  head do
    depends_on "go" => :build
  end

  def install
    v = version
    if build.head?
      v = "head"
      ldflags = "-X main.buildVersion=#{v}"
      system "go", "build", "-ldflags=#{ldflags}"
      mv "twitch-cli", "twitch"
    end

    if OS.mac? && Hardware::CPU.arm?
      ldflags = "-X main.buildVersion=#{v}"
      system "go", "build", "-ldflags=#{ldflags}"
      mv "twitch-cli", "twitch"
    end

    bin.install "twitch"
  end

  test do
    system "#{bin}/twitch", "version"
  end
end
