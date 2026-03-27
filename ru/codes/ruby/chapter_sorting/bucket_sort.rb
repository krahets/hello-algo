=begin
File: bucket_sort.rb
Created Time: 2024-04-17
Author: Martin Xu (martin.xus@gmail.com)
=end

# ## Сортировка корзинами ###
def bucket_sort(nums)
  # Инициализировать k = n/2 корзин, предполагая распределение 2 элементов в каждую корзину
  k = nums.length / 2
  buckets = Array.new(k) { [] }
  
  # 1. Распределить элементы массива по корзинам
  nums.each do |num|
    # Входные данные лежат в диапазоне [0, 1); использовать num * k для отображения в диапазон индексов [0, k-1]
    i = (num * k).to_i
    # Добавить num в корзину i
    buckets[i] << num
  end

  # 2. Выполнить сортировку внутри каждой корзины
  buckets.each do |bucket|
    # Использовать встроенную функцию сортировки; ее также можно заменить другим алгоритмом сортировки
    bucket.sort!
  end

  # 3. Обойти корзины и объединить результаты
  i = 0
  buckets.each do |bucket|
    bucket.each do |num|
      nums[i] = num
      i += 1
    end
  end
end

### Driver Code ###
if __FILE__ == $0
  # Пусть входные данные — числа с плавающей точкой из диапазона [0, 1)
  nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37]
  bucket_sort(nums)
  puts "После сортировки корзинами nums = #{nums}"
end
