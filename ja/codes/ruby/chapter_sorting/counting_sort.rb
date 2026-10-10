=begin
File: counting_sort.rb
Created Time: 2024-05-02
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 計数ソート ###
def counting_sort_naive(nums)
  # 簡易版。オブジェクトのソートには使えない
  # 1. 配列の最大要素 m を求める
  m = 0
  nums.each { |num| m = [m, num].max }
  # 2. 各数値の出現回数を数える
  # counter[num] は num の出現回数を表す
  counter = Array.new(m + 1, 0)
  nums.each { |num| counter[num] += 1 }
  # 3. counter を走査し、各要素を元の配列 nums に書き戻す
  i = 0
  for num in 0...(m + 1)
    (0...counter[num]).each do
      nums[i] = num
      i += 1
    end
  end
end

### 計数ソート ###
def counting_sort(nums)
  # 完全版。オブジェクトをソートでき、かつ安定ソートである
  # 1. 配列の最大要素 m を求める
  m = nums.max
  # 2. 各数値の出現回数を数える
  # counter[num] は num の出現回数を表す
  counter = Array.new(m + 1, 0)
  nums.each { |num| counter[num] += 1 }
  # 3. counter の累積和を求めて、「出現回数」を「末尾インデックス」に変換する
  # つまり counter[num]-1 は、num が res に最後に現れるインデックス
  (0...m).each { |i| counter[i + 1] += counter[i] }
  # 4. nums を逆順に走査し、各要素を結果配列 res に格納する
  # 結果を記録するための配列 res を初期化する
  n = nums.length
  res = Array.new(n, 0)
  (n - 1).downto(0).each do |i|
    num = nums[i]
    res[counter[num] - 1] = num # num を対応するインデックスに配置
    counter[num] -= 1 # 累積和を 1 減らして、次に num を配置するインデックスを得る
  end
  # 結果配列 res で元の配列 nums を上書きする
  (0...n).each { |i| nums[i] = res[i] }
end

### Driver Code ###
if __FILE__ == $0
  nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]

  counting_sort_naive(nums)
  puts "カウントソート（オブジェクトをソートできない）完了後 nums = #{nums}"

  nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
  counting_sort(nums1)
  puts "カウントソート完了後 nums1 = #{nums1}"
end
