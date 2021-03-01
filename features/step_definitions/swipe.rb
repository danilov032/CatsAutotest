When(/^Пользователь делает свайп "([^"]*)"$/) do |direction|
  if direction == "Вверх"
    Appium::TouchAction.new.swipe(start_x: 0.5, start_y: 0.9, end_x: 0.5, end_y: 0.1, duration: 1000).perform
  elsif direction == "Влево"
    Appium::TouchAction.new.swipe(start_x: 0.9, start_y: 0.5, end_x: 0.1, end_y: 0.5, duration: 1000).perform
  end
end