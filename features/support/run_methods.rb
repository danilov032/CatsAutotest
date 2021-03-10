def runInNewWindow(command)
  `osascript -e 'tell app "Terminal"
        do script "#{command}"
        end tell'`
end

def start_instance_appium_mac (p, bp, udid)
  runInNewWindow("appium -p #{p} -bp #{bp} -U #{udid}")
  sleep(5)
end

def start_instance_appium(p, bp, udid)
  %x[gnome-terminal --window -t "Порты: #{p} #{bp}. Телефон: #{ENV["device"]} (#{udid})" -- sh -c "appium -p #{p} -bp #{bp} " 2>/dev/null]
end

def run_cucumber(cucumber_options)
  Cucumber::Rake::Task.new do |t|
    t.cucumber_opts = cucumber_options
  end
  Rake::Task[:cucumber].invoke
end