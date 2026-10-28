=begin
File: array_binary_tree.rb
Created Time: 2024-04-17
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 배열로 표현한 이진 트리 클래스 ###
class ArrayBinaryTree
  ### 생성자 ###
  def initialize(arr)
    @tree = arr.to_a
  end

  ### 리스트 용량 ###
  def size
    @tree.length
  end

  ### 인덱스가 i인 노드의 값 반환 ###
  def val(i)
    # 인덱스가 범위를 벗어나면 빈칸을 나타내는 nil을 반환한다
    return if i < 0 || i >= size

    @tree[i]
  end

  ### 인덱스가 i인 노드의 왼쪽 자식 노드 인덱스 반환 ###
  def left(i)
    2 * i + 1
  end

  ### 인덱스가 i인 노드의 오른쪽 자식 노드 인덱스 반환 ###
  def right(i)
    2 * i + 2
  end

  ### 인덱스가 i인 노드의 부모 노드 인덱스 반환 ###
  def parent(i)
    (i - 1) / 2
  end

  ### 레벨 순서 순회 ###
  def level_order
    @res = []

    # 배열을 직접 순회한다
    for i in 0...size
      @res << val(i) unless val(i).nil?
    end

    @res
  end

  ### 깊이 우선 순회 ###
  def dfs(i, order)
    return if val(i).nil?
    # 전위 순회
    @res << val(i) if order == :pre
    dfs(left(i), order)
    # 중위 순회
    @res << val(i) if order == :in
    dfs(right(i), order)
    # 후위 순회
    @res << val(i) if order == :post
  end

  ### 전위 순회 ###
  def pre_order
    @res = []
    dfs(0, :pre)
    @res
  end

  ### 중위 순회 ###
  def in_order
    @res = []
    dfs(0, :in)
    @res
  end

  ### 후위 순회 ###
  def post_order
    @res = []
    dfs(0, :post)
    @res
  end
end

### 실행 코드 ###
if __FILE__ == $0
  # 이진 트리 초기화
  # 여기서는 배열로부터 이진 트리를 바로 생성하는 함수를 사용한다
  arr = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
  root = arr_to_tree(arr)
  puts "\n이진 트리 초기화\n\n"
  puts '이진 트리의 배열 표현:'
  pp arr
  puts '이진 트리의 연결 리스트 표현:'
  print_tree(root)

  # 배열로 표현한 이진 트리 클래스
  abt = ArrayBinaryTree.new(arr)

  # 노드 접근
  i = 1
  l, r, _p = abt.left(i), abt.right(i), abt.parent(i)
  puts "\n현재 노드의 인덱스: #{i}, 값: #{abt.val(i).inspect}"
  puts "왼쪽 자식 노드의 인덱스: #{l}, 값: #{abt.val(l).inspect}"
  puts "오른쪽 자식 노드의 인덱스: #{r}, 값: #{abt.val(r).inspect}"
  puts "부모 노드의 인덱스: #{_p}, 값: #{abt.val(_p).inspect}"

  # 트리 순회
  res = abt.level_order
  puts "\n레벨 순서 순회: #{res}"
  res = abt.pre_order
  puts "전위 순회: #{res}"
  res = abt.in_order
  puts "중위 순회: #{res}"
  res = abt.post_order
  puts "후위 순회: #{res}"
end
