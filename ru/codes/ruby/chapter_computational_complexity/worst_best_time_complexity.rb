=begin
File: worst_best_time_complexity.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Сгенерировать массив с элементами 1, 2, ..., n в случайном порядке ###
def random_numbers(n)
  # Сгенерировать массив nums = 1, 2, 3, ..., n
  nums = Array.new(n) { |i| i + 1 }
  # Случайно перемешать элементы массива
  nums.shuffle!
end

# ## Найти индекс числа 1 в массиве nums ###
def find_one(nums)
  for i in 0...nums.length
    # Когда элемент 1 находится в начале массива, достигается наилучшая временная сложность O(1)
    # Когда элемент 1 находится в конце массива, достигается наихудшая временная сложность O(n)
    return i if nums[i] == 1
  end

  -1
end

### Driver Code ###
if __FILE__ == $0
  for i in 0...10
    n = 100
    nums = random_numbers(n)
    index = find_one(nums)
    puts "\nПосле перемешивания массива [ 1, 2,..., n ] = #{nums}"
    puts "Индекс числа 1 равен #{index}"
  end
end
