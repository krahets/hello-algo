=begin
File: tree_node.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 二元樹節點類別 ###
class TreeNode
  attr_accessor :val    # 節點值
  attr_accessor :height # 節點高度
  attr_accessor :left   # 左子節點引用
  attr_accessor :right  # 右子節點引用

  def initialize(val=0)
    @val = val
    @height = 0
  end
end
