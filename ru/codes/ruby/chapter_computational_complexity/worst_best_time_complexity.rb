=begin
File: worst_best_time_complexity.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Создать массив из чисел { 1, 2, ..., n } в случайном порядке ###
def random_numbers(n)
  # Создать массив nums = { 1, 2, 3, ..., n }
  nums = Array.new(n) { |i| i + 1 }
  # Случайно перемешать элементы массива
  nums.shuffle!
end

### Найти индекс числа 1 в массиве nums ###
def find_one(nums)
  for i in 0...nums.length
    # Если 1 стоит в начале массива, сложность минимальна: O(1)
    # Если 1 стоит в конце массива, сложность максимальна: O(n)
    return i if nums[i] == 1
  end

  -1
end

### Основная программа ###
if __FILE__ == $0
  for i in 0...10
    n = 100
    nums = random_numbers(n)
    index = find_one(nums)
    puts "\nМассив [ 1, 2, ..., n ] после перемешивания = #{nums}"
    puts "Индекс числа 1: #{index}"
  end
end
