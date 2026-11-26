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

/* 函式 */
int function() {
  // 執行操作
  return 0;
}

/* 常數階 */
void constant(int n) {
  // 常數、變數、物件占用 O(1) 空間
  final int a = 0;
  int b = 0;
  List<int> nums = List.filled(10000, 0);
  ListNode node = ListNode(0);
  // 迴圈內變數占用 O(1) 空間
  for (var i = 0; i < n; i++) {
    int c = 0;
  }
  // 迴圈呼叫函式占用 O(1) 空間
  for (var i = 0; i < n; i++) {
    function();
  }
}

/* 線性階 */
void linear(int n) {
  // 長度為 n 的陣列占用 O(n) 空間
  List<int> nums = List.filled(n, 0);
  // 長度為 n 的串列占用 O(n) 空間
  List<ListNode> nodes = [];
  for (var i = 0; i < n; i++) {
    nodes.add(ListNode(i));
  }
  // 長度為 n 的雜湊表占用 O(n) 空間
  Map<int, String> map = HashMap();
  for (var i = 0; i < n; i++) {
    map.putIfAbsent(i, () => i.toString());
  }
}

/* 線性階（遞迴實作） */
void linearRecur(int n) {
  print('遞迴 n = $n');
  if (n == 1) return;
  linearRecur(n - 1);
}

/* 平方階 */
void quadratic(int n) {
  // 矩陣占用 O(n^2) 空間
  List<List<int>> numMatrix = List.generate(n, (_) => List.filled(n, 0));
  // 二維串列占用 O(n^2) 空間
  List<List<int>> numList = [];
  for (var i = 0; i < n; i++) {
    List<int> tmp = [];
    for (int j = 0; j < n; j++) {
      tmp.add(0);
    }
    numList.add(tmp);
  }
}

/* 平方階（遞迴實作） */
int quadraticRecur(int n) {
  if (n <= 0) return 0;
  List<int> nums = List.filled(n, 0);
  print('遞迴 n = $n 時，nums 的長度 = ${nums.length}');
  return quadraticRecur(n - 1);
}

/* 指數階（建完美二元樹） */
TreeNode? buildTree(int n) {
  if (n == 0) return null;
  TreeNode root = TreeNode(0);
  root.left = buildTree(n - 1);
  root.right = buildTree(n - 1);
  return root;
}

/* 主程式 */
void main() {
  int n = 5;
  // 常數階
  constant(n);
  // 線性階
  linear(n);
  linearRecur(n);
  // 平方階
  quadratic(n);
  quadraticRecur(n);
  // 指數階
  TreeNode? root = buildTree(n);
  printTree(root);
}
