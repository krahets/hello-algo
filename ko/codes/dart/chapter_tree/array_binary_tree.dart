/**
 * File: array_binary_tree.dart
 * Created Time: 2023-08-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 배열로 표현한 이진 트리 클래스 */
class ArrayBinaryTree {
  late List<int?> _tree;

  /* 생성자 */
  ArrayBinaryTree(this._tree);

  /* 리스트 용량 */
  int size() {
    return _tree.length;
  }

  /* 인덱스가 i인 노드의 값 반환 */
  int? val(int i) {
    // 인덱스가 범위를 벗어나면 빈칸을 나타내는 null을 반환한다
    if (i < 0 || i >= size()) {
      return null;
    }
    return _tree[i];
  }

  /* 인덱스가 i인 노드의 왼쪽 자식 노드 인덱스 반환 */
  int? left(int i) {
    return 2 * i + 1;
  }

  /* 인덱스가 i인 노드의 오른쪽 자식 노드 인덱스 반환 */
  int? right(int i) {
    return 2 * i + 2;
  }

  /* 인덱스가 i인 노드의 부모 노드 인덱스 반환 */
  int? parent(int i) {
    return (i - 1) ~/ 2;
  }

  /* 레벨 순서 순회 */
  List<int> levelOrder() {
    List<int> res = [];
    for (int i = 0; i < size(); i++) {
      if (val(i) != null) {
        res.add(val(i)!);
      }
    }
    return res;
  }

  /* 깊이 우선 순회 */
  void dfs(int i, String order, List<int?> res) {
    // 빈칸이면 반환한다
    if (val(i) == null) {
      return;
    }
    // 전위 순회
    if (order == 'pre') {
      res.add(val(i));
    }
    dfs(left(i)!, order, res);
    // 중위 순회
    if (order == 'in') {
      res.add(val(i));
    }
    dfs(right(i)!, order, res);
    // 후위 순회
    if (order == 'post') {
      res.add(val(i));
    }
  }

  /* 전위 순회 */
  List<int?> preOrder() {
    List<int?> res = [];
    dfs(0, 'pre', res);
    return res;
  }

  /* 중위 순회 */
  List<int?> inOrder() {
    List<int?> res = [];
    dfs(0, 'in', res);
    return res;
  }

  /* 후위 순회 */
  List<int?> postOrder() {
    List<int?> res = [];
    dfs(0, 'post', res);
    return res;
  }
}

/* 실행 코드 */
void main() {
  // 이진 트리 초기화
  // 여기서는 배열로부터 이진 트리를 바로 생성하는 함수를 사용한다
  List<int?> arr = [
    1,
    2,
    3,
    4,
    null,
    6,
    7,
    8,
    9,
    null,
    null,
    12,
    null,
    null,
    15
  ];

  TreeNode? root = listToTree(arr);
  print("\n이진 트리 초기화\n");
  print("이진 트리의 배열 표현:");
  print(arr);
  print("이진 트리의 연결 리스트 표현:");
  printTree(root);

  // 배열로 표현한 이진 트리 클래스
  ArrayBinaryTree abt = ArrayBinaryTree(arr);

  // 노드 접근
  int i = 1;
  int? l = abt.left(i);
  int? r = abt.right(i);
  int? p = abt.parent(i);
  print("\n현재 노드의 인덱스: $i , 값: ${abt.val(i)}");
  print("왼쪽 자식 노드의 인덱스: $l , 값: ${(l == null ? "null" : abt.val(l))}");
  print("오른쪽 자식 노드의 인덱스: $r , 값: ${(r == null ? "null" : abt.val(r))}");
  print("부모 노드의 인덱스: $p , 값: ${(p == null ? "null" : abt.val(p))}");

  // 트리 순회
  List<int?> res = abt.levelOrder();
  print("\n레벨 순서 순회: $res");
  res = abt.preOrder();
  print("전위 순회: $res");
  res = abt.inOrder();
  print("중위 순회: $res");
  res = abt.postOrder();
  print("후위 순회: $res");
}
