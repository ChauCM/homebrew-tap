# Homebrew formula template for Dialect.
#
# Rendered by `tool/render_homebrew_formula.dart` at release time:
# fetches the GitHub release for the given tag, extracts each
# platform's SHA-256 from SHA256SUMS, and substitutes the {{TOKEN}}
# placeholders below. The rendered file lands at
# `ChauCM/homebrew-tap`'s `Formula/dialect.rb` via the release
# workflow's bump-PR step.
#
# Edit this template (not the rendered output) for layout changes.
class Dialect < Formula
  desc "AI-native localization toolkit for Flutter-led teams"
  homepage "https://dialect.tools"
  version "1.6.0"
  license "MIT"

  # Only Apple-Silicon macOS and x86_64 Linux are published as binaries.
  # Intel-Mac and Linux-arm64 users build from source — see the README.
  on_macos do
    odie "dialect: no prebuilt macOS x86_64 binary is published; build from source: https://github.com/ChauCM/dialect#build-from-source" unless Hardware::CPU.arm?
    url "https://github.com/ChauCM/dialect/releases/download/v#{version}/dialect-macos-arm64.tar.gz"
    sha256 "c63098a0b7780477e0a07be06b6199634e4e386b0784edde854f63eece4787dc"
  end

  on_linux do
    odie "dialect: no prebuilt Linux arm64 binary is published; build from source: https://github.com/ChauCM/dialect#build-from-source" if Hardware::CPU.arm?
    url "https://github.com/ChauCM/dialect/releases/download/v#{version}/dialect-linux-x64.tar.gz"
    sha256 "654ac7c83d0a7eecd30f7dcc158e91ebb54d976f453b7bcc83de9f4f590ecb24"
  end

  def install
    bin.install "dialect"
  end

  test do
    assert_match "dialect", shell_output("#{bin}/dialect --version")
  end
end
