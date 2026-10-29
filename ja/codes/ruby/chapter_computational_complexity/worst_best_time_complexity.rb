=begin
File: worst_best_time_complexity.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 要素が 1, 2, ..., n で、順序をシャッフルした配列を生成する ###
def random_numbers(n)
  # 配列 nums =: 1, 2, 3, ..., n を生成する
  nums = Array.new(n) { |i| i + 1 }
  # 配列の要素をランダムに並べ替える
  nums.shuffle!
end

### 配列 nums 内で数値 1 のインデックスを探索する ###
def find_one(nums)
  for i in 0...nums.length
    # 要素 1 が配列の先頭にある場合、最良時間計算量 O(1) となる
    # 要素 1 が配列の末尾にある場合、最悪時間計算量 O(n) となる
    return i if nums[i] == 1
  end

  -1
end

### 実行用コード ###
if __FILE__ == $0
  for i in 0...10
    n = 100
    nums = random_numbers(n)
    index = find_one(nums)
    puts "\n配列 [ 1, 2, ..., n ] をシャッフルした結果 = #{nums}"
    puts "数値 1 のインデックスは #{index}"
  end
end
