=begin
File: linear_search.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/list_node'

### 線形探索（配列） ###
def linear_search_array(nums, target)
  # 配列を走査する
  for i in 0...nums.length
    return i if nums[i] == target # 目的の要素が見つかったので、そのインデックスを返す
  end

  -1 # 目的の要素が見つからなかったので、-1 を返す
end

### 線形探索（連結リスト） ###
def linear_search_linkedlist(head, target)
  # 連結リストを走査する
  while head
    return head if head.val == target # 目的のノードが見つかったので、それを返す

    head = head.next
  end

  nil # 目的のノードが見つからなかったので、None を返す
end

### 実行用コード ###
if __FILE__ == $0
  target = 3

  # 配列で線形探索を行う
  nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
  index = linear_search_array(nums, target)
  puts "目的の要素 3 のインデックス = #{index}"

  # 連結リストで線形探索を行う
  head = arr_to_linked_list(nums)
  node = linear_search_linkedlist(head, target)
  puts "目的のノードの値 3 に対応するノードオブジェクトは #{node}"
end
