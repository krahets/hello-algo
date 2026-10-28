/**
 * File: space_complexity.dart
 * Created Time: 2023-2-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

import 'dart:collection';
import '../utils/list_node.dart';
import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 함수 */
int function() {
  // 몇 가지 연산을 수행한다
  return 0;
}

/* 상수 차수 */
void constant(int n) {
  // 상수, 변수, 객체는 O(1) 공간을 차지한다
  final int a = 0;
  int b = 0;
  List<int> nums = List.filled(10000, 0);
  ListNode node = ListNode(0);
  // 반복문 안의 변수는 O(1) 공간을 차지한다
  for (var i = 0; i < n; i++) {
    int c = 0;
  }
  // 반복문 안의 함수는 O(1) 공간을 차지한다
  for (var i = 0; i < n; i++) {
    function();
  }
}

/* 선형 차수 */
void linear(int n) {
  // 길이가 n인 배열은 O(n) 공간을 차지한다
  List<int> nums = List.filled(n, 0);
  // 길이가 n인 리스트는 O(n) 공간을 차지한다
  List<ListNode> nodes = [];
  for (var i = 0; i < n; i++) {
    nodes.add(ListNode(i));
  }
  // 길이가 n인 해시 테이블은 O(n) 공간을 차지한다
  Map<int, String> map = HashMap();
  for (var i = 0; i < n; i++) {
    map.putIfAbsent(i, () => i.toString());
  }
}

/* 선형 차수(재귀 구현) */
void linearRecur(int n) {
  print('재귀 n = $n');
  if (n == 1) return;
  linearRecur(n - 1);
}

/* 제곱 차수 */
void quadratic(int n) {
  // 행렬은 O(n^2) 공간을 차지한다
  List<List<int>> numMatrix = List.generate(n, (_) => List.filled(n, 0));
  // 이차원 리스트는 O(n^2) 공간을 차지한다
  List<List<int>> numList = [];
  for (var i = 0; i < n; i++) {
    List<int> tmp = [];
    for (int j = 0; j < n; j++) {
      tmp.add(0);
    }
    numList.add(tmp);
  }
}

/* 제곱 차수(재귀 구현) */
int quadraticRecur(int n) {
  if (n <= 0) return 0;
  List<int> nums = List.filled(n, 0);
  print('재귀(n = $n)의 nums 길이 = ${nums.length}');
  return quadraticRecur(n - 1);
}

/* 지수 차수(포화 이진 트리 구성) */
TreeNode? buildTree(int n) {
  if (n == 0) return null;
  TreeNode root = TreeNode(0);
  root.left = buildTree(n - 1);
  root.right = buildTree(n - 1);
  return root;
}

/* 실행 코드 */
void main() {
  int n = 5;
  // 상수 차수
  constant(n);
  // 선형 차수
  linear(n);
  linearRecur(n);
  // 제곱 차수
  quadratic(n);
  quadraticRecur(n);
  // 지수 차수
  TreeNode? root = buildTree(n);
  printTree(root);
}
