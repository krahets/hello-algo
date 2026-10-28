=begin
File: binary_search_tree.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 이진 탐색 트리 ###
class BinarySearchTree
  ### 생성자 ###
  def initialize
    # 빈 트리를 초기화한다
    @root = nil
  end

  ### 이진 트리의 루트 노드 반환 ###
  def get_root
    @root
  end

  ### 노드 탐색 ###
  def search(num)
    cur = @root

    # 반복하여 탐색하다 리프 노드를 지나면 종료한다
    while !cur.nil?
      # 목표 노드는 cur의 오른쪽 서브트리에 있다
      if cur.val < num
        cur = cur.right
      # 목표 노드는 cur의 왼쪽 서브트리에 있다
      elsif cur.val > num
        cur = cur.left
      # 목표 노드를 찾았으므로 반복문을 종료한다
      else
        break
      end
    end

    cur
  end

  ### 노드 삽입 ###
  def insert(num)
    # 트리가 비어 있으면 루트 노드를 초기화한다
    if @root.nil?
      @root = TreeNode.new(num)
      return
    end

    # 반복하여 탐색하다 리프 노드를 지나면 종료한다
    cur, pre = @root, nil
    while !cur.nil?
      # 중복 노드를 찾으면 바로 반환한다
      return if cur.val == num

      pre = cur
      # 삽입 위치는 cur의 오른쪽 서브트리에 있다
      if cur.val < num
        cur = cur.right
      # 삽입 위치는 cur의 왼쪽 서브트리에 있다
      else
        cur = cur.left
      end
    end

    # 노드 삽입
    node = TreeNode.new(num)
    if pre.val < num
      pre.right = node
    else
      pre.left = node
    end
  end

  ### 노드 삭제 ###
  def remove(num)
    # 트리가 비어 있으면 바로 반환하여 종료한다
    return if @root.nil?

    # 반복하여 탐색하다 리프 노드를 지나면 종료한다
    cur, pre = @root, nil
    while !cur.nil?
      # 삭제할 노드를 찾았으므로 반복문을 종료한다
      break if cur.val == num

      pre = cur
      # 삭제할 노드는 cur의 오른쪽 서브트리에 있다
      if cur.val < num
        cur = cur.right
      # 삭제할 노드는 cur의 왼쪽 서브트리에 있다
      else
        cur = cur.left
      end
    end
    # 삭제할 노드가 없으면 바로 반환한다
    return if cur.nil?

    # 자식 노드 수 = 0 또는 1
    if cur.left.nil? || cur.right.nil?
      # 자식 노드 수 = 0 / 1이면 child = null / 해당 자식 노드이다
      child = cur.left || cur.right
      # 노드 cur를 삭제한다
      if cur != @root
        if pre.left == cur
          pre.left = child
        else
          pre.right = child
        end
      else
        # 삭제할 노드가 루트 노드이면 루트 노드를 다시 지정한다
        @root = child
      end
    # 자식 노드 수 = 2
    else
      # 중위 순회에서 cur의 다음 노드를 구한다
      tmp = cur.right
      while !tmp.left.nil?
        tmp = tmp.left
      end
      # 노드 tmp를 재귀적으로 삭제한다
      remove(tmp.val)
      # tmp로 cur를 덮어쓴다
      cur.val = tmp.val
    end
  end
end

### 실행 코드 ###
if __FILE__ == $0
  # 이진 탐색 트리 초기화
  bst = BinarySearchTree.new
  nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
  # 삽입 순서에 따라 서로 다른 이진 트리가 생성된다. 이 순서는 포화 이진 트리를 생성할 수 있다
  nums.each { |num| bst.insert(num) }
  puts "\n초기화한 이진 트리\n"
  print_tree(bst.get_root)

  # 노드 탐색
  node = bst.search(7)
  puts "\n찾은 노드 객체: #{node}, 노드 값 = #{node.val}"

  # 노드 삽입
  bst.insert(16)
  puts "\n노드 16을 삽입한 후의 이진 트리\n"
  print_tree(bst.get_root)

  # 노드 삭제
  bst.remove(1)
  puts "\n노드 1을 삭제한 후의 이진 트리\n"
  print_tree(bst.get_root)

  bst.remove(2)
  puts "\n노드 2를 삭제한 후의 이진 트리\n"
  print_tree(bst.get_root)

  bst.remove(4)
  puts "\n노드 4를 삭제한 후의 이진 트리\n"
  print_tree(bst.get_root)
end
