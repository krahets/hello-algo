=begin
File: bucket_sort.rb
Created Time: 2024-04-17
Author: Martin Xu (martin.xus@gmail.com)
=end

### Блочная сортировка ###
def bucket_sort(nums)
  # Создать k = n/2 блоков в расчёте на два элемента в каждом
  k = nums.length / 2
  buckets = Array.new(k) { [] }
  
  # 1. Распределить элементы массива по блокам
  nums.each do |num|
    # Значения лежат в [0, 1). Умножение num * k даёт индекс в [0, k-1]
    i = (num * k).to_i
    # Добавить num в блок i
    buckets[i] << num
  end

  # 2. Отсортировать каждый блок
  buckets.each do |bucket|
    # Используем встроенную сортировку. Её можно заменить другим алгоритмом
    bucket.sort!
  end

  # 3. Обойти блоки и объединить результаты
  i = 0
  buckets.each do |bucket|
    bucket.each do |num|
      nums[i] = num
      i += 1
    end
  end
end

### Тестовый пример ###
if __FILE__ == $0
  # Входные данные — числа с плавающей точкой из интервала [0, 1)
  nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37]
  bucket_sort(nums)
  puts "После блочной сортировки nums = #{nums}"
end
