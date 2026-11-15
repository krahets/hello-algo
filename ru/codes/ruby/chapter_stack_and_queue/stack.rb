=begin
File: stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # [region]{init_stack}
  # Инициализировать стек
  # В Ruby нет встроенного класса стека, поэтому Array можно использовать как стек
  stack = []
  # [endregion]{init_stack}

  # [region]{push}
  # Помещение элемента в стек
  stack << 1
  stack << 3
  stack << 2
  stack << 5
  stack << 4
  # [endregion]{push}
  puts "Стек stack = #{stack}"

  # [region]{peek}
  # Доступ к верхнему элементу стека
  peek = stack.last
  # [endregion]{peek}
  puts "Верхний элемент peek = #{peek}"

  # [region]{pop}
  # Извлечение элемента из стека
  pop = stack.pop
  # [endregion]{pop}
  puts "Извлеченный элемент pop = #{pop}"
  puts "stack после извлечения = #{stack}"

  # [region]{size}
  # Получение длины стека
  size = stack.length
  # [endregion]{size}
  puts "Длина стека size = #{size}"

  # [region]{is_empty}
  # Проверка на пустоту
  is_empty = stack.empty?
  # [endregion]{is_empty}
  puts "Пуст ли стек = #{is_empty}"
end
