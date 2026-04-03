cask "pet-typeless" do
  version "1.0.0"
  sha256 "4f9313451bb1044878f497f5b7fd7513168689b2530f4f92b704936555f98a94"

  url "https://github.com/ZhaoChaoqun/pet-typeless/releases/download/v#{version}/Pet-Typeless-#{version}.zip"
  name "Pet Typeless"
  desc "Cloud-powered macOS voice-to-text tool"
  homepage "https://github.com/ZhaoChaoqun/pet-typeless"

  depends_on macos: ">= :sonoma"

  app "Pet Typeless.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Pet Typeless.app"]
  end

  uninstall script: {
    executable: "/bin/sh",
    args:       ["-c", "killall 'Pet Typeless' 2>/dev/null; tccutil reset Accessibility com.pettypeless.app; tccutil reset Microphone com.pettypeless.app"],
    sudo:       false,
  }

  zap trash: [
    "~/Library/Preferences/com.pettypless.app.plist",
  ]

  caveats <<~EOS
    Pet Typeless requires the following permissions:
    - Microphone: for voice recording
    - Accessibility: for global Fn key detection

    After installation, grant permissions in:
    System Settings > Privacy & Security > Microphone
    System Settings > Privacy & Security > Accessibility
  EOS
end
