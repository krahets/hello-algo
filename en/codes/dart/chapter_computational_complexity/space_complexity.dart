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

/* Function */
int function() {
  // Perform some operations
  return 0;
}

/* Constant complexity */
void constant(int n) {
  // Constants, variables, objects occupy O(1) space
  final int a = 0;
  int b = 0;
  List<int> nums = List.filled(10000, 0);
  ListNode node = ListNode(0);
  // Variables in a loop occupy O(1) space
  for (var i = 0; i < n; i++) {
    int c = 0;
  }
  // Functions in a loop occupy O(1) space
  for (var i = 0; i < n; i++) {
    function();
  }
}

/* Linear complexity */
void linear(int n) {
  // Array of length n occupies O(n) space
  List<int> nums = List.filled(n, 0);
  // A list of length n occupies O(n) space
  List<ListNode> nodes = [];
  for (var i = 0; i < n; i++) {
    nodes.add(ListNode(i));
  }
  // A hash table of length n occupies O(n) space
  Map<int, String> map = HashMap();
  for (var i = 0; i < n; i++) {
    map.putIfAbsent(i, () => i.toString());
  }
}

/* Linear complexity (recursive implementation) */
void linearRecur(int n) {
  print('递归 n = $n');
  if (n == 1) return;
  linearRecur(n - 1);
}

/* Quadratic complexity */
void quadratic(int n) {
  // Matrix occupies O(n^2) space
  List<List<int>> numMatrix = List.generate(n, (_) => List.filled(n, 0));
  // A two-dimensional list occupies O(n^2) space
  List<List<int>> numList = [];
  for (var i = 0; i < n; i++) {
    List<int> tmp = [];
    for (int j = 0; j < n; j++) {
      tmp.add(0);
    }
    numList.add(tmp);
  }
}

/* Quadratic complexity (recursive implementation) */
int quadraticRecur(int n) {
  if (n <= 0) return 0;
  List<int> nums = List.filled(n, 0);
  print('递归 n = $n 中的 nums 长度 = ${nums.length}');
  return quadraticRecur(n - 1);
}

/* Exponential complexity (building a full binary tree) */
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
  // Constant complexity
  constant(n);
  // Linear complexity
  linear(n);
  linearRecur(n);
  // Quadratic complexity
  quadratic(n);
  quadraticRecur(n);
  // Exponential complexity
  TreeNode? root = buildTree(n);
  printTree(root);
}
