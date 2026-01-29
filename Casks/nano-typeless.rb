cask "nano-typeless" do
  version "1.1.1"
  sha256 "3e06bfbbaeeab920c5a38bd1619f546d2e8bbaec92d9d58b7cbe4882814e7427"

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
