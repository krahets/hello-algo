=begin
File: array.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 要素にランダムアクセスする ###
def random_access(nums)
  # 区間 [0, nums.length) から数値をランダムに 1 つ選ぶ
  random_index = Random.rand(0...nums.length)

  # ランダムに選んだ要素を取得して返す
  nums[random_index]
end


### 配列の長さを拡張する ###
# Ruby の Array は動的配列なので、そのまま拡張できることに注意
# 学習しやすいように、この関数では Array を長さが変わらない配列として扱う
def extend(nums, enlarge)
  # 拡張後の長さの配列を初期化する
  res = Array.new(nums.length + enlarge, 0)

  # 元の配列の全要素を新しい配列にコピーする
  for i in 0...nums.length
    res[i] = nums[i]
  end

  # 拡張後の新しい配列を返す
  res
end

### 配列のインデックス index に要素 num を挿入する ###
def insert(nums, num, index)
  # インデックス index 以降の全要素を 1 つ後ろにずらす
  for i in (nums.length - 1).downto(index + 1)
    nums[i] = nums[i - 1]
  end

  # インデックス index の要素に num を代入する
  nums[index] = num
end


### インデックス index の要素を削除する ###
def remove(nums, index)
  # インデックス index より後の全要素を 1 つ前にずらす
  for i in index...(nums.length - 1)
    nums[i] = nums[i + 1]
  end
end

### 配列を走査する ###
def traverse(nums)
  count = 0

  # インデックスを使って配列を走査する
  for i in 0...nums.length
    count += nums[i]
  end

  # 配列の要素を直接走査する
  for num in nums
    count += num
  end
end

### 配列から指定した要素を探索する ###
def find(nums, target)
  for i in 0...nums.length
    return i if nums[i] == target
  end

  -1
end


### 実行用コード ###
if __FILE__ == $0
  # 配列を初期化する
  arr = Array.new(5, 0)
  puts "配列 arr = #{arr}"
  nums = [1, 3, 2, 5, 4]
  puts "配列 nums = #{nums}"

  # ランダムアクセス
  random_num = random_access(nums)
  puts "nums からランダムに取得した要素 #{random_num}"

  # 長さの拡張
  nums = extend(nums, 3)
  puts "配列の長さを 8 に拡張した結果 nums = #{nums}"

  # 要素を挿入する
  insert(nums, 6, 3)
  puts "インデックス 3 に数値 6 を挿入した結果 nums = #{nums}"

  # 要素を削除する
  remove(nums, 2)
  puts "インデックス 2 の要素を削除した結果 nums = #{nums}"

  # 配列を走査する
  traverse(nums)

  # 要素を探索する
  index = find(nums, 3)
  puts "nums から要素 3 を探索した結果のインデックス = #{index}"
end
