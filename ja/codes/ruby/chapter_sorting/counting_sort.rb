=begin
File: counting_sort.rb
Created Time: 2024-05-02
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### カウントソート ###
def counting_sort_naive(nums)
  # 簡易実装。オブジェクトのソートには使えない
  # 1. 配列の最大要素 m を求める
  m = 0
  nums.each { |num| m = [m, num].max }
  # 2. 各数値の出現回数を数える
  # counter[num] は num の出現回数を表す
  counter = Array.new(m + 1, 0)
  nums.each { |num| counter[num] += 1 }
  # 3. counter を走査し、各要素を元の配列 nums に入れる
  i = 0
  for num in 0...(m + 1)
    (0...counter[num]).each do
      nums[i] = num
      i += 1
    end
  end
end

### カウントソート ###
def counting_sort(nums)
  # 完全な実装。オブジェクトをソートでき、安定ソートである
  # 1. 配列の最大要素 m を求める
  m = nums.max
  # 2. 各数値の出現回数を数える
  # counter[num] は num の出現回数を表す
  counter = Array.new(m + 1, 0)
  nums.each { |num| counter[num] += 1 }
  # 3. counter の累積和を求め、「出現回数」を「末尾のインデックス」に変換する
  # つまり、counter[num]-1 は res 内で num が最後に現れるインデックスである
  (0...m).each { |i| counter[i + 1] += counter[i] }
  # 4. nums を逆順に走査し、各要素を結果配列 res に入れる
  # 結果を記録する配列 res を初期化する
  n = nums.length
  res = Array.new(n, 0)
  (n - 1).downto(0).each do |i|
    num = nums[i]
    res[counter[num] - 1] = num # 対応するインデックスに num を配置する
    counter[num] -= 1 # 累積和を 1 減らし、次に num を配置するインデックスを求める
  end
  # 結果配列 res で元の配列 nums を上書きする
  (0...n).each { |i| nums[i] = res[i] }
end

### 実行用コード ###
if __FILE__ == $0
  nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]

  counting_sort_naive(nums)
  puts "カウントソート（オブジェクトはソート不可）の完了後 nums = #{nums}"

  nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
  counting_sort(nums1)
  puts "カウントソート完了後 nums1 = #{nums1}"
end
