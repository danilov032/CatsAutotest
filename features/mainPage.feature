#language: ru

Функциональность: Неавторизованный пользователь
  @test
  Сценарий: Проверка элементов
    Дано Ждем появления элемента "Кнопка избранное" с id "buttonFavourites", но не более "40" секунд
    Дано Пользователь проверяет наличие элемента "321" с id "132"
#    И Пользователь проверяет наличие элемента "321" с id "132" и индексом "0"
    И Пользователь делает свайп "Вверх"
    И Ожидаем "10" секунд