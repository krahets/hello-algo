=begin
File: two_sum.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

### Способ 1: полный перебор ###
def two_sum_brute_force(nums, target)
  # Два вложенных цикла, временная сложность O(n^2)
  for i in 0...(nums.length - 1)
    for j in (i + 1)...nums.length
      return [i, j] if nums[i] + nums[j] == target
    end
  end

  []
end

### Способ 2: вспомогательная хеш-таблица ###
def two_sum_hash_table(nums, target)
  # Вспомогательная хеш-таблица, пространственная сложность O(n)
  dic = {}
  # Один цикл, временная сложность O(n)
  for i in 0...nums.length
    return [dic[target - nums[i]], i] if dic.has_key?(target - nums[i])

    dic[nums[i]] = i
  end

  []
end

### Пример использования ###
if __FILE__ == $0
  # ======= Тестовый пример =======
  nums = [2, 7, 11, 15]
  target = 13

  # ====== Пример использования ======
  # Способ 1
  res = two_sum_brute_force(nums, target)
  puts "Способ 1, res = #{res}"
  # Способ 2
  res = two_sum_hash_table(nums, target)
  puts "Способ 2, res = #{res}"
end
