cask "nano-typeless" do
  version "1.1.0"
  sha256 "58f7e012e641ec1bd657976fc800fa08fe1203a67320f5d4edeb1f86159c270f"

  url "https://github.com/ZhaoChaoqun/typeless/releases/download/v#{version}/Typeless-#{version}.zip"
  name "Nano Typeless"
  desc "Lightweight macOS voice-to-text tool powered by local Whisper AI"
  homepage "https://github.com/ZhaoChaoqun/typeless"

  depends_on macos: ">= :sonoma"

  app "Typeless.app"

  zap trash: [
    "~/Library/Preferences/com.typeless.app.plist",
    "~/Documents/huggingface/models/argmaxinc/whisperkit-coreml",
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
