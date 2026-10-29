=begin
File: two_sum.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

### 方法 1：総当たり列挙 ###
def two_sum_brute_force(nums, target)
  # 二重ループのため、時間計算量は O(n^2)
  for i in 0...(nums.length - 1)
    for j in (i + 1)...nums.length
      return [i, j] if nums[i] + nums[j] == target
    end
  end

  []
end

### 方法 2：補助ハッシュテーブル ###
def two_sum_hash_table(nums, target)
  # 補助ハッシュテーブルの空間計算量は O(n)
  dic = {}
  # 一重ループのため、時間計算量は O(n)
  for i in 0...nums.length
    return [dic[target - nums[i]], i] if dic.has_key?(target - nums[i])

    dic[nums[i]] = i
  end

  []
end

### 実行用コード ###
if __FILE__ == $0
  # ======= テストケース =======
  nums = [2, 7, 11, 15]
  target = 13

  # ====== 実行用コード ======
  # 方法 1
  res = two_sum_brute_force(nums, target)
  puts "方法 1 res = #{res}"
  # 方法 2
  res = two_sum_hash_table(nums, target)
  puts "方法 2 res = #{res}"
end
