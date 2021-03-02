When(/^Ожидаем "([^"]*)" секунд$/) do |duration|
  sleep(duration.to_i)
end

When(/^Ждем появления элемента "([^"]*)" с id "([^"]*)", но не более "([^"]*)" секунд$/) do |name, id, time|
  waiting(id, time)
end