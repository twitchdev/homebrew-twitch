# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class TwitchCli < Formula
  desc "CLI for Twitch's developer offerings"
  homepage "https://github.com/twitchdev/twitch-cli"
  version "0.4.0"
  license "Apache-2.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/twitchdev/twitch-cli/releases/download/0.4.0/twitch-cli_0.4.0_Darwin_x86_64.tar.gz"
    sha256 "a89cd8b79539b17e779cbdb016ec43d759d9a6f1d06d20c27ec08aa232743b29"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/twitchdev/twitch-cli/releases/download/0.4.0/twitch-cli_0.4.0_Linux_x86_64.tar.gz"
    sha256 "cd22f604b7d92efc0ca7138d997a4e91638521f6ceafe94f64a773b3dae0570a"
  end

  def install
    bin.install "twitch"
  end

  test do
    system "#{bin}/twitch -v"
  end
end
