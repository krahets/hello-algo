=begin
File: array.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 要素にランダムアクセス ###
def random_access(nums)
  # 区間 [0, nums.length) からランダムに 1 つの数を選ぶ
  random_index = Random.rand(0...nums.length)

  # ランダムな要素を取得して返す
  nums[random_index]
end


### 配列長を拡張 ###
# Ruby の Array は動的配列であり、直接拡張できます
# 学習しやすいよう、本関数では Array を長さ不変の配列として扱います
def extend(nums, enlarge)
  # 拡張後の長さを持つ配列を初期化する
  res = Array.new(nums.length + enlarge, 0)

  # 元の配列の全要素を新しい配列にコピー
  for i in 0...nums.length
    res[i] = nums[i]
  end

  # 拡張後の新しい配列を返す
  res
end

### 配列のインデックス index に要素 num を挿入 ###
def insert(nums, num, index)
  # インデックス index 以降の全要素を 1 つ後ろへ移動する
  for i in (nums.length - 1).downto(index + 1)
    nums[i] = nums[i - 1]
  end

  # index の要素に num を代入する
  nums[index] = num
end


### インデックス index の要素を削除 ###
def remove(nums, index)
  # インデックス index より後ろの全要素を 1 つ前へ移動する
  for i in index...(nums.length - 1)
    nums[i] = nums[i + 1]
  end
end

### 配列を走査 ###
def traverse(nums)
  count = 0

  # インデックスで配列を走査
  for i in 0...nums.length
    count += nums[i]
  end

  # 配列要素を直接走査
  for num in nums
    count += num
  end
end

### 配列内の指定要素を検索 ###
def find(nums, target)
  for i in 0...nums.length
    return i if nums[i] == target
  end

  -1
end


### Driver Code ###
if __FILE__ == $0
  # 配列を初期化
  arr = Array.new(5, 0)
  puts "配列 arr = #{arr}"
  nums = [1, 3, 2, 5, 4]
  puts "配列 nums = #{nums}"

  # ランダムアクセス
  random_num = random_access(nums)
  puts "nums からランダムな要素 #{random_num} を取得"

  # 長さを拡張
  nums = extend(nums, 3)
  puts "配列の長さを 8 に拡張し、nums = #{nums}"

  # 要素を挿入する
  insert(nums, 6, 3)
  puts "インデックス 3 に数値 6 を挿入し、nums = #{nums}"

  # 要素を削除
  remove(nums, 2)
  puts "インデックス 2 の要素を削除し、nums = #{nums}"

  # 配列を走査
  traverse(nums)

  # 要素を探索する
  index = find(nums, 3)
  puts "nums 内で要素 3 を検索し、インデックス = #{index}"
end
