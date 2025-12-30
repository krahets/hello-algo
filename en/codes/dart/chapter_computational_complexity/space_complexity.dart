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

/* Constant order */
void constant(int n) {
  // Constants, variables, objects occupy O(1) space
  final int a = 0;
  int b = 0;
  List<int> nums = List.filled(10000, 0);
  ListNode node = ListNode(0);
  // Variables in the loop occupy O(1) space
  for (var i = 0; i < n; i++) {
    int c = 0;
  }
  // Functions in the loop occupy O(1) space
  for (var i = 0; i < n; i++) {
    function();
  }
}

/* Linear order */
void linear(int n) {
  // Array of length n uses O(n) space
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

/* Linear order (recursive implementation) */
void linearRecur(int n) {
  print('Recursion n = $n');
  if (n == 1) return;
  linearRecur(n - 1);
}

/* Exponential order */
void quadratic(int n) {
  // Matrix uses O(n^2) space
  List<List<int>> numMatrix = List.generate(n, (_) => List.filled(n, 0));
  // 2D list uses O(n^2) space
  List<List<int>> numList = [];
  for (var i = 0; i < n; i++) {
    List<int> tmp = [];
    for (int j = 0; j < n; j++) {
      tmp.add(0);
    }
    numList.add(tmp);
  }
}

/* Quadratic order (recursive implementation) */
int quadraticRecur(int n) {
  if (n <= 0) return 0;
  List<int> nums = List.filled(n, 0);
  print('In recursion n = $n, nums length = ${nums.length}');
  return quadraticRecur(n - 1);
}

/* Driver Code */
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
  // Constant order
  constant(n);
  // Linear order
  linear(n);
  linearRecur(n);
  // Exponential order
  quadratic(n);
  quadraticRecur(n);
  // Exponential order
  TreeNode? root = buildTree(n);
  printTree(root);
}
