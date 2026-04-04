cask "pet-typeless" do
  version "1.0.2"
  sha256 "3e84a1a23e5fc397a9096c1e3c953789cfb1e5c538c3e2c8ff39cf1b45b3544b"

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
