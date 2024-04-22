=begin
File: binary_search_tree.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 二元搜尋樹 ###
class BinarySearchTree
  ### 建構子 ###
  def initialize
    # 初始化空樹
    @root = nil
  end

  ### 獲取二元樹根節點 ###
  def get_root
    @root
  end

  ### 查詢節點 ###
  def search(num)
    cur = @root

    # 迴圈查詢，越過葉節點後跳出
    while !cur.nil?
      # 目標節點在 cur 的右子樹中
      if cur.val < num
        cur = cur.right
      # 目標節點在 cur 的左子樹中
      elsif cur.val > num
        cur = cur.left
      # 找到目標節點，跳出迴圈
      else
        break
      end
    end

    cur
  end

  ### 插入節點 ###
  def insert(num)
    # 若樹為空，則初始化根節點
    if @root.nil?
      @root = TreeNode.new(num)
      return
    end

    # 迴圈查詢，越過葉節點後跳出
    cur, pre = @root, nil
    while !cur.nil?
      # 找到重複節點，直接返回
      return if cur.val == num

      pre = cur
      # 插入位置在 cur 的右子樹中
      if cur.val < num
        cur = cur.right
      # 插入位置在 cur 的左子樹中
      else
        cur = cur.left
      end
    end

    # 插入節點
    node = TreeNode.new(num)
    if pre.val < num
      pre.right = node
    else
      pre.left = node
    end
  end

  ### 刪除節點 ###
  def remove(num)
    # 若樹為空，直接提前返回
    return if @root.nil?

    # 迴圈查詢，越過葉節點後跳出
    cur, pre = @root, nil
    while !cur.nil?
      # 找到待刪除節點，跳出迴圈
      break if cur.val == num

      pre = cur
      # 待刪除節點在 cur 的右子樹中
      if cur.val < num
        cur = cur.right
      # 待刪除節點在 cur 的左子樹中
      else
        cur = cur.left
      end
    end
    # 若無待刪除節點，則直接返回
    return if cur.nil?

    # 子節點數量 = 0 or 1
    if cur.left.nil? || cur.right.nil?
      # 當子節點數量 = 0 / 1 時， child = null / 該子節點
      child = cur.left || cur.right
      # 刪除節點 cur
      if cur != @root
        if pre.left == cur
          pre.left = child
        else
          pre.right = child
        end
      else
        # 若刪除節點為根節點，則重新指定根節點
        @root = child
      end
    # 子節點數量 = 2
    else
      # 獲取中序走訪中 cur 的下一個節點
      tmp = cur.right
      while !tmp.left.nil?
        tmp = tmp.left
      end
      # 遞迴刪除節點 tmp
      remove(tmp.val)
      # 用 tmp 覆蓋 cur
      cur.val = tmp.val
    end
  end
end

### Driver Code ###
if __FILE__ == $0
  # 初始化二元搜尋樹
  bst = BinarySearchTree.new
  nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
  # 請注意，不同的插入順序會生成不同的二元樹，該序列可以生成一個完美二元樹
  nums.each { |num| bst.insert(num) }
  puts "\n初始化的二元樹為\n"
  print_tree(bst.get_root)

  # 查詢節點
  node = bst.search(7)
  puts "\n查詢到的節點物件為: #{node}，節點值 = #{node.val}"

  # 插入節點
  bst.insert(16)
  puts "\n插入節點 16 後，二元樹為\n"
  print_tree(bst.get_root)

  # 刪除節點
  bst.remove(1)
  puts "\n刪除節點 1 後，二元樹為\n"
  print_tree(bst.get_root)

  bst.remove(2)
  puts "\n刪除節點 2 後，二元樹為\n"
  print_tree(bst.get_root)

  bst.remove(4)
  puts "\n刪除節點 4 後，二元樹為\n"
  print_tree(bst.get_root)
end
