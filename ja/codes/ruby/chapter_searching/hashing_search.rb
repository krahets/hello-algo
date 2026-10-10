=begin
File: hashing_search.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/list_node'

### ハッシュ検索（配列） ###
def hashing_search_array(hmap, target)
  # ハッシュテーブルの key: 目標要素、value: インデックス
  # ハッシュテーブルにこの key がなければ -1 を返す
  hmap[target] || -1
end

### ハッシュ検索（連結リスト） ###
def hashing_search_linkedlist(hmap, target)
  # ハッシュテーブルの key: 対象要素、value: ノードオブジェクト
  # ハッシュテーブルにこの key がなければ None を返す
  hmap[target] || nil
end

### Driver Code ###
if __FILE__ == $0
  target = 3

  # ハッシュ探索（配列）
  nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
  # ハッシュテーブルを初期化
  map0 = {}
  for i in 0...nums.length
    map0[nums[i]] = i # key: 要素、value: インデックス
  end
  index = hashing_search_array(map0, target)
  puts "対象要素 3 のインデックス = #{index}"

  # ハッシュ探索（連結リスト）
  head = arr_to_linked_list(nums)
  # ハッシュテーブルを初期化
  map1 = {}
  while head
    map1[head.val] = head
    head = head.next
  end
  node = hashing_search_linkedlist(map1, target)
  puts "対象ノード値 3 に対応するノードオブジェクトは #{node}"
end
