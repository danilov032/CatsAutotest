require 'appium_lib'

$project_path = "/Users/danilov.and/RubymineProjects/AutoTestCats"

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

def exist_element?(element)
  begin
    return true if find_element(element)
  rescue
    return false
  end
end

def waiting_element_id_with_stop(id, time)
  spent_time = 0
  until exist_element?(id: id)
    sleep (0.5)
    spent_time += 1
    if spent_time.to_i > time.to_i
      raise "Элемент #{id} не появился спустя #{spent_time} секунд"
    end
  end
end

def waiting (id, time)
  spent_time = 0
  until exist_element?(id: id)
    sleep(0.5)
    spent_time += 1
    break if spent_time.to_i > time.to_i
  end
end

