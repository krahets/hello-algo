=begin
File: hashing_search.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/list_node'

### ハッシュ探索（配列） ###
def hashing_search_array(hmap, target)
  # ハッシュテーブルの key：目的の要素、value：インデックス
  # ハッシュテーブルにこの key が存在しない場合、-1 を返す
  hmap[target] || -1
end

### ハッシュ探索（連結リスト） ###
def hashing_search_linkedlist(hmap, target)
  # ハッシュテーブルの key：目的の要素、value：ノードオブジェクト
  # ハッシュテーブルにこの key が存在しない場合、None を返す
  hmap[target] || nil
end

### 実行用コード ###
if __FILE__ == $0
  target = 3

  # ハッシュ探索（配列）
  nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
  # ハッシュテーブルを初期化する
  map0 = {}
  for i in 0...nums.length
    map0[nums[i]] = i # key：要素、value：インデックス
  end
  index = hashing_search_array(map0, target)
  puts "目的の要素 3 のインデックス = #{index}"

  # ハッシュ探索（連結リスト）
  head = arr_to_linked_list(nums)
  # ハッシュテーブルを初期化する
  map1 = {}
  while head
    map1[head.val] = head
    head = head.next
  end
  node = hashing_search_linkedlist(map1, target)
  puts "目的のノードの値 3 に対応するノードオブジェクトは #{node}"
end
