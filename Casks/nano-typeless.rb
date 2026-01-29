cask "nano-typeless" do
  version "1.1.3"
  sha256 "8ad6136b48c7364d3b1cd69576568f60fb5b69f631b4bf4d858528ca2972fbf6"

  url "https://github.com/ZhaoChaoqun/typeless/releases/download/v#{version}/Typeless-#{version}.zip"
  name "Nano Typeless"
  desc "Lightweight macOS voice-to-text tool powered by local Whisper AI"
  homepage "https://github.com/ZhaoChaoqun/typeless"

  depends_on macos: ">= :sonoma"

  app "Typeless.app"

  zap trash: [
    "~/Library/Preferences/com.typeless.app.plist",
    "~/Library/Application Support/Typeless",
  ]

  caveats <<~EOS
    If macOS shows "Apple cannot verify" warning, run:
      xattr -cr /Applications/Typeless.app

    Typeless requires the following permissions:
    - Microphone: for voice recording
    - Accessibility: for global Fn key detection

    After installation, grant permissions in:
    System Settings > Privacy & Security > Microphone
    System Settings > Privacy & Security > Accessibility
  EOS
end
