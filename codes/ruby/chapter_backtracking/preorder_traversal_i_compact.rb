=begin
File: preorder_traversal_i_compact.rb
Created Time: 2024-04-07
Author: hoangtien2k3 (hoangtien2k3qx1@gmail.com)
=end

require_relative 'utils'

# 前序遍历：例题一
def pre_order(root)
  return if root.nil?

  if root.val == 7
    # 记录解
    $res << root
  end

  pre_order(root.left)
  pre_order(root.right)
end

root = TreeNode.list_to_tree([1, 7, 3, 4, 5, 6, 7])
puts "\n初始化二叉树"
PrintUtil.print_tree(root)

# 前序遍历
$res = []
pre_order(root)

puts "\n输出所有值为 7 的节点"
vals = []
$res.each { |node| vals << node.val }
puts vals