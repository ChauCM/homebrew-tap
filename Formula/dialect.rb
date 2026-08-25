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
  version "1.4.0"
  license "MIT"

  # Only Apple-Silicon macOS and x86_64 Linux are published as binaries.
  # Intel-Mac and Linux-arm64 users build from source — see the README.
  on_macos do
    odie "dialect: no prebuilt macOS x86_64 binary is published; build from source: https://github.com/ChauCM/dialect#build-from-source" unless Hardware::CPU.arm?
    url "https://github.com/ChauCM/dialect/releases/download/v#{version}/dialect-macos-arm64.tar.gz"
    sha256 "6bd755155c61e52d1da7fe3333d1dbe6c0243a925535e62e67f12dc9a6d4a80c"
  end

  on_linux do
    odie "dialect: no prebuilt Linux arm64 binary is published; build from source: https://github.com/ChauCM/dialect#build-from-source" if Hardware::CPU.arm?
    url "https://github.com/ChauCM/dialect/releases/download/v#{version}/dialect-linux-x64.tar.gz"
    sha256 "3557d15aa5ae70a10e8e27962b1946ec43fdcb838041276511e6f8160580519a"
  end

  def install
    bin.install "dialect"
  end

  test do
    assert_match "dialect", shell_output("#{bin}/dialect --version")
  end
end
