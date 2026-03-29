=begin
File: worst_best_time_complexity.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 1, 2, ..., n を要素とする配列を生成し、順序をシャッフルする ###
def random_numbers(n)
  # 配列 nums =: 1, 2, 3, ..., n を生成する
  nums = Array.new(n) { |i| i + 1 }
  # 配列要素をランダムにシャッフル
  nums.shuffle!
end

### 配列 nums 内の数値 1 のインデックスを探す ###
def find_one(nums)
  for i in 0...nums.length
    # 要素 1 が配列の先頭にあるとき、最良時間計算量 O(1) となる
    # 要素 1 が配列の末尾にあるとき、最悪時間計算量 O(n) となる
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
    puts "\n配列 [ 1, 2, ..., n ] をシャッフルした後 = #{nums}"
    puts "数字 1 のインデックスは #{index}"
  end
end
