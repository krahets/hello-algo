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

/* 函数 */
int function() {
  // 执行某些操作
  return 0;
}

/* 常数阶 */
void constant(int n) {
  // 常量、变量、对象占用 O(1) 空间
  final int a = 0;
  int b = 0;
  List<int> nums = List.filled(10000, 0);
  ListNode node = ListNode(0);
  // 循环中的变量占用 O(1) 空间
  for (var i = 0; i < n; i++) {
    int c = 0;
  }
  // 循环中的函数占用 O(1) 空间
  for (var i = 0; i < n; i++) {
    function();
  }
}

/* 线性阶 */
void linear(int n) {
  // 长度为 n 的数组占用 O(n) 空间
  List<int> nums = List.filled(n, 0);
  // 长度为 n 的列表占用 O(n) 空间
  List<ListNode> nodes = [];
  for (var i = 0; i < n; i++) {
    nodes.add(ListNode(i));
  }
  // 长度为 n 的哈希表占用 O(n) 空间
  Map<int, String> map = HashMap();
  for (var i = 0; i < n; i++) {
    map.putIfAbsent(i, () => i.toString());
  }
}

/* 线性阶（递归实现） */
void linearRecur(int n) {
  print('递归 n = $n');
  if (n == 1) return;
  linearRecur(n - 1);
}

/* 平方阶 */
void quadratic(int n) {
  // 矩阵占用 O(n^2) 空间
  List<List<int>> numMatrix = List.generate(n, (_) => List.filled(n, 0));
  // 二维列表占用 O(n^2) 空间
  List<List<int>> numList = [];
  for (var i = 0; i < n; i++) {
    List<int> tmp = [];
    for (int j = 0; j < n; j++) {
      tmp.add(0);
    }
    numList.add(tmp);
  }
}

/* 平方阶（递归实现） */
int quadraticRecur(int n) {
  if (n <= 0) return 0;
  List<int> nums = List.filled(n, 0);
  print('递归 n = $n 中的 nums 长度 = ${nums.length}');
  return quadraticRecur(n - 1);
}

/* 指数阶（建立满二叉树） */
TreeNode? buildTree(int n) {
  if (n == 0) return null;
  TreeNode root = TreeNode(0);
  root.left = buildTree(n - 1);
  root.right = buildTree(n - 1);
  return root;
}

/* Driver Code */
void main() {
  int n = 5;
  // 常数阶
  constant(n);
  // 线性阶
  linear(n);
  linearRecur(n);
  // 平方阶
  quadratic(n);
  quadraticRecur(n);
  // 指数阶
  TreeNode? root = buildTree(n);
  printTree(root);
}
