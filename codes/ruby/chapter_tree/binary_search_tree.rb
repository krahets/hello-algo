=begin
File: binary_search_tree.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 二叉搜索树 ###
class BinarySearchTree
  ### 构造方法 ###
  def initialize
    # 初始化空树
    @root = nil
  end

  ### 获取二叉树根节点 ###
  def get_root
    @root
  end

  ### 查找节点 ###
  def search(num)
    cur = @root

    # 循环查找，越过叶节点后跳出
    while !cur.nil?
      # 目标节点在 cur 的右子树中
      if cur.val < num
        cur = cur.right
      # 目标节点在 cur 的左子树中
      elsif cur.val > num
        cur = cur.left
      # 找到目标节点，跳出循环
      else
        break
      end
    end

    cur
  end

  ### 插入节点 ###
  def insert(num)
    # 若树为空，则初始化根节点
    if @root.nil?
      @root = TreeNode.new(num)
      return
    end

    # 循环查找，越过叶节点后跳出
    cur, pre = @root, nil
    while !cur.nil?
      # 找到重复节点，直接返回
      return if cur.val == num

      pre = cur
      # 插入位置在 cur 的右子树中
      if cur.val < num
        cur = cur.right
      # 插入位置在 cur 的左子树中
      else
        cur = cur.left
      end
    end

    # 插入节点
    node = TreeNode.new(num)
    if pre.val < num
      pre.right = node
    else
      pre.left = node
    end
  end

  ### 删除节点 ###
  def remove(num)
    # 若树为空，直接提前返回
    return if @root.nil?

    # 循环查找，越过叶节点后跳出
    cur, pre = @root, nil
    while !cur.nil?
      # 找到待删除节点，跳出循环
      break if cur.val == num

      pre = cur
      # 待删除节点在 cur 的右子树中
      if cur.val < num
        cur = cur.right
      # 待删除节点在 cur 的左子树中
      else
        cur = cur.left
      end
    end
    # 若无待删除节点，则直接返回
    return if cur.nil?

    # 子节点数量 = 0 or 1
    if cur.left.nil? || cur.right.nil?
      # 当子节点数量 = 0 / 1 时， child = null / 该子节点
      child = cur.left || cur.right
      # 删除节点 cur
      if cur != @root
        if pre.left == cur
          pre.left = child
        else
          pre.right = child
        end
      else
        # 若删除节点为根节点，则重新指定根节点
        @root = child
      end
    # 子节点数量 = 2
    else
      # 获取中序遍历中 cur 的下一个节点
      tmp = cur.right
      while !tmp.left.nil?
        tmp = tmp.left
      end
      # 递归删除节点 tmp
      remove(tmp.val)
      # 用 tmp 覆盖 cur
      cur.val = tmp.val
    end
  end
end

### Driver Code ###
if __FILE__ == $0
  # 初始化二叉搜索树
  bst = BinarySearchTree.new
  nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
  # 请注意，不同的插入顺序会生成不同的二叉树，该序列可以生成一个完美二叉树
  nums.each { |num| bst.insert(num) }
  puts "\n初始化的二叉树为\n"
  print_tree(bst.get_root)

  # 查找节点
  node = bst.search(7)
  puts "\n查找到的节点对象为: #{node}，节点值 = #{node.val}"

  # 插入节点
  bst.insert(16)
  puts "\n插入节点 16 后，二叉树为\n"
  print_tree(bst.get_root)

  # 删除节点
  bst.remove(1)
  puts "\n删除节点 1 后，二叉树为\n"
  print_tree(bst.get_root)

  bst.remove(2)
  puts "\n删除节点 2 后，二叉树为\n"
  print_tree(bst.get_root)

  bst.remove(4)
  puts "\n删除节点 4 后，二叉树为\n"
  print_tree(bst.get_root)
end
