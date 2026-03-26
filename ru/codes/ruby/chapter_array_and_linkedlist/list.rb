=begin
File: list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # Инициализировать список
  nums = [1, 3, 2, 5, 4]
  puts "список nums = #{nums}"

  # Получить доступ к элементу
  num = nums[1]
  puts "обратиться киндекс 1 поэлемент, получаем num = #{num}"

  # Обновить элемент
  nums[1] = 0
  puts "После обновления элемента по индексу 1 на 0 получаем nums = #{nums}"

  # Очистить список
  nums.clear
  puts "Очистить списокпосле nums = #{nums}"

  # Добавить элемент в конец
  nums << 1
  nums << 3
  nums << 2
  nums << 5
  nums << 4
  puts "После добавления элемента nums = #{nums}"

  # Вставить элемент в середину
  nums.insert(3, 6)
  puts "После вставки элемента 6 по индексу 3 получаем nums = #{nums}"

  # Удалить элемент
  nums.delete_at(3)
  puts "После удаления элемента по индексу 3 получаем nums = #{nums}"

  # Обходить список по индексам
  count = 0
  for i in 0...nums.length
    count += nums[i]
  end

  # Непосредственно обходить элементы списка
  count = 0
  nums.each do |x|
    count += x
  end

  # Объединить два списка
  nums1 = [6, 8, 7, 10, 9]
  nums += nums1
  puts "После присоединения списка nums1 к nums получаем nums = #{nums}"

  nums = nums.sort { |a, b| a <=> b }
  puts "Отсортировать списокпосле nums = #{nums}"
end
