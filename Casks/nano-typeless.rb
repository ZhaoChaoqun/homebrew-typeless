cask "nano-typeless" do
  version "1.2.17"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

  url "https://github.com/ZhaoChaoqun/nano-typeless/releases/download/v#{version}/Nano-Typeless-#{version}.zip"
  name "Nano Typeless"
  desc "Lightweight macOS voice-to-text tool powered by local AI"
  homepage "https://github.com/ZhaoChaoqun/nano-typeless"

  depends_on macos: ">= :sonoma"

  conflicts_with cask: "typeless"

  app "Nano Typeless.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Nano Typeless.app"]
  end

  uninstall script: {
    executable: "/bin/sh",
    args:       ["-c", "killall 'Nano Typeless' 2>/dev/null; tccutil reset Accessibility com.typeless.app; tccutil reset Microphone com.typeless.app"],
    sudo:       false,
  }

  zap trash: [
    "~/Library/Preferences/com.typeless.app.plist",
    "~/Library/Application Support/Nano Typeless",
  ]

  caveats <<~EOS
    Nano Typeless requires the following permissions:
    - Microphone: for voice recording
    - Accessibility: for global Fn key detection

    After installation, grant permissions in:
    System Settings > Privacy & Security > Microphone
    System Settings > Privacy & Security > Accessibility
  EOS
end
