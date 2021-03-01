When(/^Ожидаем "([^"]*)" секунд$/) do |duration|
  sleep(duration.to_i)
end