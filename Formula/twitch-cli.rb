# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class TwitchCli < Formula
  desc "CLI for Twitch's developer offerings"
  homepage "https://github.com/twitchdev/twitch-cli"
  version "1.1.16"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/twitchdev/twitch-cli/releases/download/v1.1.16/twitch-cli_1.1.16_Darwin_arm64.tar.gz"
      sha256 "06a734583e6fef1a3a1a99e79f850c124b5823786cae20eace137236c0ed6b8f"

      def install
        bin.install "twitch"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/twitchdev/twitch-cli/releases/download/v1.1.16/twitch-cli_1.1.16_Darwin_x86_64.tar.gz"
      sha256 "2caa6b70d5af4d9a54995a67c6c93454003e9cb8e15eadd8fe4961c37f76ea13"

      def install
        bin.install "twitch"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/twitchdev/twitch-cli/releases/download/v1.1.16/twitch-cli_1.1.16_Linux_arm64.tar.gz"
      sha256 "32dd29f0e2e2c598b32c37e3215b9829cb4b46050df0f4b702adcae286db5819"

      def install
        bin.install "twitch"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/twitchdev/twitch-cli/releases/download/v1.1.16/twitch-cli_1.1.16_Linux_x86_64.tar.gz"
      sha256 "afa7e604f532351219c05e23bc9e0207e0d53f2798ace387487333ce88565568"

      def install
        bin.install "twitch"
      end
    end
  end

  test do
    system "#{bin}/twitch", "version"
  end
end
