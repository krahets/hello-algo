=begin
File: avl_tree.rb
Created Time: 2024-04-17
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### AVL 트리 ###
class AVLTree
  ### 생성자 ###
  def initialize
    @root = nil
  end

  ### 이진 트리의 루트 노드 반환 ###
  def get_root
    @root
  end

  ### 노드 높이 반환 ###
  def height(node)
    # 빈 노드의 높이는 -1이고, 리프 노드의 높이는 0이다
    return node.height unless node.nil?

    -1
  end

  ### 노드 높이를 갱신한다 ###
  def update_height(node)
    # 노드 높이는 가장 높은 서브트리의 높이 + 1이다
    node.height = [height(node.left), height(node.right)].max + 1
  end

  ### 균형 인수 반환 ###
  def balance_factor(node)
    # 빈 노드의 균형 인수는 0이다
    return 0 if node.nil?

    # 노드의 균형 인수 = 왼쪽 서브트리 높이 - 오른쪽 서브트리 높이
    height(node.left) - height(node.right)
  end

  ### 오른쪽 회전 연산 ###
  def right_rotate(node)
    child = node.left
    grand_child = child.right
    # child를 중심으로 node를 오른쪽으로 회전한다
    child.right = node
    node.left = grand_child
    # 노드 높이를 갱신한다
    update_height(node)
    update_height(child)
    # 회전한 서브트리의 루트 노드를 반환한다
    child
  end

  ### 왼쪽 회전 연산 ###
  def left_rotate(node)
    child = node.right
    grand_child = child.left
    # child를 중심으로 node를 왼쪽으로 회전한다
    child.left = node
    node.right = grand_child
    # 노드 높이를 갱신한다
    update_height(node)
    update_height(child)
    # 회전한 서브트리의 루트 노드를 반환한다
    child
  end

  ### 회전 연산을 수행하여 해당 서브트리의 균형 복원 ###
  def rotate(node)
    # 노드 node의 균형 인수를 구한다
    balance_factor = balance_factor(node)
    # 왼쪽으로 치우친 트리
    if balance_factor > 1
      if balance_factor(node.left) >= 0
        # 오른쪽 회전
        return right_rotate(node)
      else
        # 왼쪽으로 회전한 후 오른쪽으로 회전한다
        node.left = left_rotate(node.left)
        return right_rotate(node)
      end
    # 오른쪽으로 치우친 트리
    elsif balance_factor < -1
      if balance_factor(node.right) <= 0
        # 왼쪽 회전
        return left_rotate(node)
      else
        # 오른쪽으로 회전한 후 왼쪽으로 회전한다
        node.right = right_rotate(node.right)
        return left_rotate(node)
      end
    end
    # 균형 트리이므로 회전할 필요 없이 바로 반환한다
    node
  end

  ### 노드 삽입 ###
  def insert(val)
    @root = insert_helper(@root, val)
  end

  ### 노드의 재귀적 삽입(보조 메서드)###
  def insert_helper(node, val)
    return TreeNode.new(val) if node.nil?
    # 1. 삽입 위치를 찾아 노드를 삽입한다
    if val < node.val
      node.left = insert_helper(node.left, val)
    elsif val > node.val
      node.right = insert_helper(node.right, val)
    else
      # 중복 노드는 삽입하지 않고 바로 반환한다
      return node
    end
    # 노드 높이를 갱신한다
    update_height(node)
    # 2. 회전 연산을 수행하여 해당 서브트리의 균형을 복원한다
    rotate(node)
  end

  ### 노드 삭제 ###
  def remove(val)
    @root = remove_helper(@root, val)
  end

  ### 노드의 재귀적 삭제(보조 메서드)###
  def remove_helper(node, val)
    return if node.nil?
    # 1. 노드를 찾아 삭제한다
    if val < node.val
      node.left = remove_helper(node.left, val)
    elsif val > node.val
      node.right = remove_helper(node.right, val)
    else
      if node.left.nil? || node.right.nil?
        child = node.left || node.right
        # 자식 노드 수 = 0이면 node를 바로 삭제하고 반환한다
        return if child.nil?
        # 자식 노드 수 = 1이면 node를 바로 삭제한다
        node = child
      else
        # 자식 노드 수 = 2이면 중위 순회의 다음 노드를 삭제하고, 그 노드로 현재 노드를 대체한다
        temp = node.right
        while !temp.left.nil?
          temp = temp.left
        end
        node.right = remove_helper(node.right, temp.val)
        node.val = temp.val
      end
    end
    # 노드 높이를 갱신한다
    update_height(node)
    # 2. 회전 연산을 수행하여 해당 서브트리의 균형을 복원한다
    rotate(node)
  end

  ### 노드 탐색 ###
  def search(val)
    cur = @root
    # 반복하여 탐색하다 리프 노드를 지나면 종료한다
    while !cur.nil?
      # 목표 노드는 cur의 오른쪽 서브트리에 있다
      if cur.val < val
        cur = cur.right
      # 목표 노드는 cur의 왼쪽 서브트리에 있다
      elsif cur.val > val
        cur = cur.left
      # 목표 노드를 찾았으므로 반복문을 종료한다
      else
        break
      end
    end
    # 목표 노드를 반환한다
    cur
  end
end

### 실행 코드 ###
if __FILE__ == $0
  def test_insert(tree, val)
    tree.insert(val)
    puts "\n노드 삽입 후의 AVL 트리(노드: #{val})"
    print_tree(tree.get_root)
  end

  def test_remove(tree, val)
    tree.remove(val)
    puts "\n노드 삭제 후의 AVL 트리(노드: #{val})"
    print_tree(tree.get_root)
  end

  # 빈 AVL 트리 초기화
  avl_tree = AVLTree.new

  # 노드 삽입
  # 노드를 삽입한 후 AVL 트리가 어떻게 균형을 유지하는지 살펴본다
  for val in [1, 2, 3, 4, 5, 8, 7, 9, 10, 6]
    test_insert(avl_tree, val)
  end

  # 중복 노드 삽입
  test_insert(avl_tree, 7)

  # 노드 삭제
  # 노드를 삭제한 후 AVL 트리가 어떻게 균형을 유지하는지 살펴본다
  test_remove(avl_tree, 8) # 차수가 0인 노드 삭제
  test_remove(avl_tree, 5) # 차수가 1인 노드 삭제
  test_remove(avl_tree, 4) # 차수가 2인 노드 삭제

  result_node = avl_tree.search(7)
  puts "\n찾은 노드 객체: #{result_node}, 노드 값 = #{result_node.val}"
end
