cask "nano-typeless" do
  version "1.1.3"
  sha256 "e8470414ffadd43b820ea72255f7e503f861b22e7ca80d32c278d98153a50d60"

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
