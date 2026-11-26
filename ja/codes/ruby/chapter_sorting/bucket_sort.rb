=begin
File: bucket_sort.rb
Created Time: 2024-04-17
Author: Martin Xu (martin.xus@gmail.com)
=end

### バケットソート ###
def bucket_sort(nums)
  # k = n/2 個のバケットを初期化。各バケットには平均 2 要素が入る想定
  k = nums.length / 2
  buckets = Array.new(k) { [] }
  
  # 1. 配列の要素を各バケットに振り分ける
  nums.each do |num|
    # 入力範囲は [0, 1)。num * k でインデックスの範囲 [0, k-1] に写す
    i = (num * k).to_i
    # num をバケット i に追加
    buckets[i] << num
  end

  # 2. 各バケットをソートする
  buckets.each do |bucket|
    # 組み込みのソート関数を使用。他のソートアルゴリズムでもよい
    bucket.sort!
  end

  # 3. バケットを順に連結
  i = 0
  buckets.each do |bucket|
    bucket.each do |num|
      nums[i] = num
      i += 1
    end
  end
end

### 実行例 ###
if __FILE__ == $0
  # 入力は [0, 1) の範囲の浮動小数点数とする
  nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37]
  bucket_sort(nums)
  puts "バケットソート後の nums = #{nums}"
end
