When(/^Пользователь проверяет наличие элемента "([^"]*)" с id "([^"]*)"$/) do |name, id|
  waiting_element_id_with_stop(id, 10)
end

When(/^Пользователь проверяет наличие элемента "([^"]*)" с id "([^"]*)" и индексом "([^"]*)"$/) do |name, id, index|
  waiting_element_id_with_stop(id, 10)
  if find_element(id: id)[index]!= nil
    puts "Есть элемент #{name} с id #{id}"
  else
    raise "Нет элемента #{name}!"
  end
end