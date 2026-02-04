cask "nano-typeless" do
  version "1.2.7"
  sha256 "e9dca2517520c2bb52b5b850590ed7d08298b8a932a2f41dd55c181696acade4"

  url "https://github.com/ZhaoChaoqun/nano-typeless/releases/download/v#{version}/Nano-Typeless-#{version}.zip"
  name "Nano Typeless"
  desc "Lightweight macOS voice-to-text tool powered by local FunASR AI"
  homepage "https://github.com/ZhaoChaoqun/nano-typeless"

  depends_on macos: ">= :sonoma"

  conflicts_with cask: "typeless"

  app "Nano Typeless.app"

  uninstall script: {
    executable: "/usr/bin/tccutil",
    args:       ["reset", "Accessibility", "com.typeless.app"],
    sudo:       false,
  }

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
