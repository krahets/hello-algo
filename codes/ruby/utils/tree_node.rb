=begin
File: tree_node.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 二叉树节点类 ###
class TreeNode
  attr_accessor :val    # 节点值
  attr_accessor :height # 节点高度
  attr_accessor :left   # 左子节点引用
  attr_accessor :right  # 右子节点引用

  def initialize(val=0)
    @val = val
    @height = 0
  end
end
