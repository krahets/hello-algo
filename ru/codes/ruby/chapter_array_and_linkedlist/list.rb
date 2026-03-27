=begin
File: list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # Инициализация списка
  nums = [1, 3, 2, 5, 4]
  puts "Список nums = #{nums}"

  # Доступ к элементу
  num = nums[1]
  puts "Элемент по индексу 1: num = #{num}"

  # Обновление элемента
  nums[1] = 0
  puts "После обновления элемента по индексу 1 до 0 nums = #{nums}"

  # Очистить список
  nums.clear
  puts "После очистки списка nums = #{nums}"

  # Добавление элемента в конец
  nums << 1
  nums << 3
  nums << 2
  nums << 5
  nums << 4
  puts "После добавления элементов nums = #{nums}"

  # Вставка элемента в середину
  nums.insert(3, 6)
  puts "После вставки элемента 6 по индексу 3 nums = #{nums}"

  # Удаление элемента
  nums.delete_at(3)
  puts "После удаления элемента по индексу 3 nums = #{nums}"

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
  puts "После конкатенации списка nums1 к nums nums = #{nums}"

  nums = nums.sort { |a, b| a <=> b }
  puts "После сортировки списка nums = #{nums}"
end
