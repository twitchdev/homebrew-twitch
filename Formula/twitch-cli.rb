# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class TwitchCli < Formula
  desc "CLI for Twitch's developer offerings"
  homepage "https://github.com/twitchdev/twitch-cli"
  version "0.3.2"
  license "Apache-2.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/twitchdev/twitch-cli/releases/download/v0.3.2/twitch-cli_0.3.2_Darwin_x86_64.tar.gz"
    sha256 "ddedaae4254bca0c7648e7b88ed9a99d19630d104c3ac687daa3683600a6b81b"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/twitchdev/twitch-cli/releases/download/v0.3.2/twitch-cli_0.3.2_Linux_x86_64.tar.gz"
    sha256 "02ed4aaa839574ceda273329d29f3cd84503277a8cd706e50c24e3290e0f3414"
  end

  def install
    bin.install "twitch"
  end

  test do
    system "#{bin}/twitch -v"
  end
end
