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

/* Constant space */
void constant(int n) {
  // Constants, variables, and objects use O(1) space
  final int a = 0;
  int b = 0;
  List<int> nums = List.filled(10000, 0);
  ListNode node = ListNode(0);
  // Variables in the loop use O(1) space
  for (var i = 0; i < n; i++) {
    int c = 0;
  }
  // Function calls in the loop use O(1) space
  for (var i = 0; i < n; i++) {
    function();
  }
}

/* Linear space */
void linear(int n) {
  // An array of length n uses O(n) space
  List<int> nums = List.filled(n, 0);
  // A list of length n uses O(n) space
  List<ListNode> nodes = [];
  for (var i = 0; i < n; i++) {
    nodes.add(ListNode(i));
  }
  // A hash table with n entries uses O(n) space
  Map<int, String> map = HashMap();
  for (var i = 0; i < n; i++) {
    map.putIfAbsent(i, () => i.toString());
  }
}

/* Linear space (recursive) */
void linearRecur(int n) {
  print('Recursive call: n = $n');
  if (n == 1) return;
  linearRecur(n - 1);
}

/* Quadratic space */
void quadratic(int n) {
  // A matrix uses O(n^2) space
  List<List<int>> numMatrix = List.generate(n, (_) => List.filled(n, 0));
  // A two-dimensional list uses O(n^2) space
  List<List<int>> numList = [];
  for (var i = 0; i < n; i++) {
    List<int> tmp = [];
    for (int j = 0; j < n; j++) {
      tmp.add(0);
    }
    numList.add(tmp);
  }
}

/* Quadratic space (recursive) */
int quadraticRecur(int n) {
  if (n <= 0) return 0;
  List<int> nums = List.filled(n, 0);
  print('Recursive call: n = $n, length of nums = ${nums.length}');
  return quadraticRecur(n - 1);
}

/* Exponential space (build a perfect binary tree) */
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
  // Constant space
  constant(n);
  // Linear space
  linear(n);
  linearRecur(n);
  // Quadratic space
  quadratic(n);
  quadraticRecur(n);
  // Exponential space
  TreeNode? root = buildTree(n);
  printTree(root);
}
