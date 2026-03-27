=begin
File: two_sum.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

# ## Метод 1: полный перебор ###
def two_sum_brute_force(nums, target)
  # Два вложенных цикла, временная сложность O(n^2)
  for i in 0...(nums.length - 1)
    for j in (i + 1)...nums.length
      return [i, j] if nums[i] + nums[j] == target
    end
  end

  []
end

# ## Метод 2: вспомогательная хеш-таблица ###
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

### Driver Code ###
if __FILE__ == $0
  # ======= Test Case =======
  nums = [2, 7, 11, 15]
  target = 13

  # ====== Основной код ======
  # Метод 1
  res = two_sum_brute_force(nums, target)
  puts "Результат метода 1 res = #{res}"
  # Метод 2
  res = two_sum_hash_table(nums, target)
  puts "Результат метода 2 res = #{res}"
end
