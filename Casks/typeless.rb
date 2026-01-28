cask "typeless" do
  version "1.0.0"
  sha256 "4c4ab308994027241e114fc83b31d6ae6977ea5cb26ce38449dcfd5d06b3a339"

  url "https://github.com/ZhaoChaoqun/typeless/releases/download/v#{version}/Typeless-#{version}.zip"
  name "Typeless"
  desc "macOS voice-to-text tool powered by local Whisper AI"
  homepage "https://github.com/ZhaoChaoqun/typeless"

  depends_on macos: ">= :sonoma"

  app "Typeless.app"

  zap trash: [
    "~/Library/Preferences/com.typeless.app.plist",
    "~/Documents/huggingface/models/argmaxinc/whisperkit-coreml",
  ]

  caveats <<~EOS
    Typeless requires the following permissions:
    - Microphone: for voice recording
    - Accessibility: for global Fn key detection

    After installation, grant permissions in:
    System Settings > Privacy & Security > Microphone
    System Settings > Privacy & Security > Accessibility
  EOS
end
