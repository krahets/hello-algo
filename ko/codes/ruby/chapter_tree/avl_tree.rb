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

  ### 이진 트리의 루트 노드 구하기 ###
  def get_root
    @root
  end

  ### 노드 높이 구하기 ###
  def height(node)
    # 빈 노드의 높이는 -1, 리프 노드의 높이는 0이다
    return node.height unless node.nil?

    -1
  end

  ### 노드 높이 갱신 ###
  def update_height(node)
    # 노드 높이는 가장 높은 서브트리의 높이에 1을 더한 값이다
    node.height = [height(node.left), height(node.right)].max + 1
  end

  ### 균형 인수 구하기 ###
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
    # child를 축으로 node를 오른쪽으로 회전한다
    child.right = node
    node.left = grand_child
    # 노드 높이 갱신
    update_height(node)
    update_height(child)
    # 회전 후 서브트리의 루트 노드를 반환한다
    child
  end

  ### 왼쪽 회전 연산 ###
  def left_rotate(node)
    child = node.right
    grand_child = child.left
    # child를 축으로 node를 왼쪽으로 회전한다
    child.left = node
    node.right = grand_child
    # 노드 높이 갱신
    update_height(node)
    update_height(child)
    # 회전 후 서브트리의 루트 노드를 반환한다
    child
  end

  ### 회전으로 이 서브트리의 균형을 회복한다 ###
  def rotate(node)
    # 노드 node의 균형 인수를 구한다
    balance_factor = balance_factor(node)
    # 왼쪽으로 치우친 트리
    if balance_factor > 1
      if balance_factor(node.left) >= 0
        # 오른쪽 회전
        return right_rotate(node)
      else
        # 왼쪽 회전 후 오른쪽 회전
        node.left = left_rotate(node.left)
        return right_rotate(node)
      end
    # 오른쪽으로 치우친 트리
    elsif balance_factor < -1
      if balance_factor(node.right) <= 0
        # 왼쪽 회전
        return left_rotate(node)
      else
        # 오른쪽 회전 후 왼쪽 회전
        node.right = right_rotate(node.right)
        return left_rotate(node)
      end
    end
    # 균형이 잡혔으므로 회전 없이 바로 반환한다
    node
  end

  ### 노드 삽입 ###
  def insert(val)
    @root = insert_helper(@root, val)
  end

  ### 재귀적 노드 삽입(보조 메서드)###
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
    # 노드 높이 갱신
    update_height(node)
    # 2. 회전으로 이 서브트리의 균형을 회복한다
    rotate(node)
  end

  ### 노드 삭제 ###
  def remove(val)
    @root = remove_helper(@root, val)
  end

  ### 재귀적 노드 삭제(보조 메서드)###
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
        # 자식 수 = 0. node를 바로 삭제하고 반환한다
        return if child.nil?
        # 자식 수 = 1. node를 바로 삭제한다
        node = child
      else
        # 자식 수 = 2. 중위 순회에서 다음에 오는 노드를 삭제하고 그 값으로 현재 노드의 값을 대체한다
        temp = node.right
        while !temp.left.nil?
          temp = temp.left
        end
        node.right = remove_helper(node.right, temp.val)
        node.val = temp.val
      end
    end
    # 노드 높이 갱신
    update_height(node)
    # 2. 회전으로 이 서브트리의 균형을 회복한다
    rotate(node)
  end

  ### 노드 탐색 ###
  def search(val)
    cur = @root
    # 반복해서 찾다가 리프 노드를 지나면 종료한다
    while !cur.nil?
      # 찾는 노드는 cur의 오른쪽 서브트리에 있다
      if cur.val < val
        cur = cur.right
      # 찾는 노드는 cur의 왼쪽 서브트리에 있다
      elsif cur.val > val
        cur = cur.left
      # 찾는 노드를 발견했으므로 반복문을 종료한다
      else
        break
      end
    end
    # 찾은 노드를 반환한다
    cur
  end
end

### 실행 코드 ###
if __FILE__ == $0
  def test_insert(tree, val)
    tree.insert(val)
    puts "\n노드 #{val} 삽입 후 AVL 트리:"
    print_tree(tree.get_root)
  end

  def test_remove(tree, val)
    tree.remove(val)
    puts "\n노드 #{val} 삭제 후 AVL 트리:"
    print_tree(tree.get_root)
  end

  # 빈 AVL 트리 초기화
  avl_tree = AVLTree.new

  # 노드 삽입
  # 노드를 삽입한 뒤 AVL 트리가 어떻게 균형을 유지하는지 살펴본다
  for val in [1, 2, 3, 4, 5, 8, 7, 9, 10, 6]
    test_insert(avl_tree, val)
  end

  # 중복 노드 삽입
  test_insert(avl_tree, 7)

  # 노드 삭제
  # 노드를 삭제한 뒤 AVL 트리가 어떻게 균형을 유지하는지 살펴본다
  test_remove(avl_tree, 8) # 차수가 0인 노드 삭제
  test_remove(avl_tree, 5) # 차수가 1인 노드 삭제
  test_remove(avl_tree, 4) # 차수가 2인 노드 삭제

  result_node = avl_tree.search(7)
  puts "\n찾은 노드 객체: #{result_node}, 노드 값 = #{result_node.val}"
end
