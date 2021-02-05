require 'appium_lib'

def caps
  {caps:{
      deviceName: "Name",
      platformName: "Android",
      app: (File.join(File.dirname(__FILE__ ), "app-debug.apk")),
      appPackage: " com.example.catstestapp",
      appActiviry: "com.example.catstestapp.ui.main.MainActivity",
      newCommandTimeout: "3600"
    }
  }
end

Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object