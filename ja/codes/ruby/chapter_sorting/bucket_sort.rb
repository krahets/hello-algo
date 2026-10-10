=begin
File: bucket_sort.rb
Created Time: 2024-04-17
Author: Martin Xu (martin.xus@gmail.com)
=end

### バケットソート ###
def bucket_sort(nums)
  # k = n/2 個のバケットを初期化し、各バケットに 2 要素ずつ割り当てる想定とする
  k = nums.length / 2
  buckets = Array.new(k) { [] }
  
  # 1. 配列要素を各バケットに振り分ける
  nums.each do |num|
    # 入力データの範囲は [0, 1) であり、num * k を用いてインデックス範囲 [0, k-1] に写像する
    i = (num * k).to_i
    # num をバケット i に追加
    buckets[i] << num
  end

  # 2. 各バケットをソートする
  buckets.each do |bucket|
    # 組み込みのソート関数を使う。他のソートアルゴリズムに置き換えてもよい
    bucket.sort!
  end

  # 3. バケットを走査して結果を結合
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
  # 入力データは範囲 [0, 1) の浮動小数点数とする
  nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37]
  bucket_sort(nums)
  puts "バケットソート完了後 nums = #{nums}"
end
