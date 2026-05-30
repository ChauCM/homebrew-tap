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
  version "1.1.0"
  license "MIT"

  # Only Apple-Silicon macOS and x86_64 Linux are published as binaries.
  # Intel-Mac and Linux-arm64 users build from source — see the README.
  on_macos do
    odie "dialect: no prebuilt macOS x86_64 binary is published; build from source: https://github.com/ChauCM/dialect#build-from-source" unless Hardware::CPU.arm?
    url "https://github.com/ChauCM/dialect/releases/download/v#{version}/dialect-macos-arm64.tar.gz"
    sha256 "cbb82466003557fd7b2b4ed1653d2eeabebb184c355e3793a3cb5d151d9c5799"
  end

  on_linux do
    odie "dialect: no prebuilt Linux arm64 binary is published; build from source: https://github.com/ChauCM/dialect#build-from-source" if Hardware::CPU.arm?
    url "https://github.com/ChauCM/dialect/releases/download/v#{version}/dialect-linux-x64.tar.gz"
    sha256 "89f0748eb8d9432b927767a29eb6a743d0cb3b8d1821414dcd299939cd7f2011"
  end

  def install
    bin.install "dialect"
  end

  test do
    assert_match "dialect", shell_output("#{bin}/dialect --version")
  end
end
