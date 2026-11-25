=begin
File: worst_best_time_complexity.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 1, 2, ..., n をランダムに並べた配列を生成 ###
def random_numbers(n)
  # 1, 2, 3, ..., n を順に格納した配列 nums を生成
  nums = Array.new(n) { |i| i + 1 }
  # 配列の要素をシャッフル
  nums.shuffle!
end

### 配列 nums で数値 1 のインデックスを探す ###
def find_one(nums)
  for i in 0...nums.length
    # 1 が配列の先頭にあるとき、最良時間計算量 O(1) となる
    # 1 が配列の末尾にあるとき、最悪時間計算量 O(n) となる
    return i if nums[i] == 1
  end

  -1
end

### 実行例 ###
if __FILE__ == $0
  for i in 0...10
    n = 100
    nums = random_numbers(n)
    index = find_one(nums)
    puts "\n配列 [ 1, 2, ..., n ] のシャッフル結果 = #{nums}"
    puts "数値 1 のインデックスは #{index}"
  end
end
