=begin
File: array.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 要素にランダムにアクセスする ###
def random_access(nums)
  # 区間 [0, nums.length) から数をランダムに選ぶ
  random_index = Random.rand(0...nums.length)

  # ランダムに選んだ要素を取得して返す
  nums[random_index]
end


### 配列の長さを増やす ###
# Ruby の Array は動的配列なので、そのまま拡張できる
# 学習しやすいように、この関数では Array を固定長の配列として扱う
def extend(nums, enlarge)
  # 長さを増やした配列を初期化する
  res = Array.new(nums.length + enlarge, 0)

  # 元の配列の全要素を新しい配列にコピーする
  for i in 0...nums.length
    res[i] = nums[i]
  end

  # 長さを増やした新しい配列を返す
  res
end

### 配列のインデックス index に要素 num を挿入する ###
def insert(nums, num, index)
  # インデックス index 以降の全要素を後ろに 1 つずらす
  for i in (nums.length - 1).downto(index + 1)
    nums[i] = nums[i - 1]
  end

  # インデックス index の要素に num を代入する
  nums[index] = num
end


### インデックス index の要素を削除する ###
def remove(nums, index)
  # インデックス index より後ろの全要素を前に 1 つずらす
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

### 配列から指定した要素を探す ###
def find(nums, target)
  for i in 0...nums.length
    return i if nums[i] == target
  end

  -1
end


### ドライバコード ###
if __FILE__ == $0
  # 配列を初期化する
  arr = Array.new(5, 0)
  puts "配列 arr = #{arr}"
  nums = [1, 3, 2, 5, 4]
  puts "配列 nums = #{nums}"

  # ランダムアクセス
  random_num = random_access(nums)
  puts "nums からランダムに選んだ要素：#{random_num}"

  # 配列の長さを増やす
  nums = extend(nums, 3)
  puts "配列の長さを 8 に増やした後の nums = #{nums}"

  # 要素を挿入する
  insert(nums, 6, 3)
  puts "インデックス 3 に 6 を挿入した後の nums = #{nums}"

  # 要素を削除する
  remove(nums, 2)
  puts "インデックス 2 の要素を削除した後の nums = #{nums}"

  # 配列を走査する
  traverse(nums)

  # 要素を探す
  index = find(nums, 3)
  puts "nums で要素 3 が見つかったインデックス = #{index}"
end
