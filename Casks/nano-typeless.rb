cask "nano-typeless" do
  version "1.2.5"
  sha256 "cd78776b9663e0c26b2b47a635998073ac2a15811925e7d2e75cbe268d6480a8"

  url "https://github.com/ZhaoChaoqun/nano-typeless/releases/download/v#{version}/Nano-Typeless-#{version}.zip"
  name "Nano Typeless"
  desc "Lightweight macOS voice-to-text tool powered by local FunASR AI"
  homepage "https://github.com/ZhaoChaoqun/nano-typeless"

  depends_on macos: ">= :sonoma"

  conflicts_with cask: "typeless"

  app "Nano Typeless.app"

  zap trash: [
    "~/Library/Preferences/com.typeless.app.plist",
    "~/Library/Application Support/Nano Typeless",
  ]

  caveats <<~EOS
    If macOS shows "Apple cannot verify" warning, run:
      xattr -cr "/Applications/Nano Typeless.app"

    Nano Typeless requires the following permissions:
    - Microphone: for voice recording
    - Accessibility: for global Fn key detection

    After installation, grant permissions in:
    System Settings > Privacy & Security > Microphone
    System Settings > Privacy & Security > Accessibility
  EOS
end
