=begin
File: bucket_sort.rb
Created Time: 2024-04-17
Author: Martin Xu (martin.xus@gmail.com)
=end

# ## Сортировка по бакетам ###
def bucket_sort(nums)
  # Инициализировать k = n/2 бакетов, предполагая, что в каждый бакет попадут 2 элемента
  k = nums.length / 2
  buckets = Array.new(k) { [] }
  
  # 1. Распределить элементы массива по бакетам
  nums.each do |num|
    # Входданныедиапазонравно [0, 1), Использовать num * k отобразить виндексдиапазон [0, k-1]
    i = (num * k).to_i
    # Добавить num в бакет i
    buckets[i] << num
  end

  # 2. Выполнить сортировку внутри каждого бакета
  buckets.each do |bucket|
    # Использовать встроенную функцию сортировки; при необходимости ее можно заменить другим алгоритмом сортировки
    bucket.sort!
  end

  # 3. Обойти бакеты и объединить результат
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
  # ПустьВходданныеравночисла с плавающей точкой, диапазонравно [0, 1)
  nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37]
  bucket_sort(nums)
  puts "Сортировка по бакетампосле завершения nums = #{nums}"
end
