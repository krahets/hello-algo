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

/* 関数 */
int function() {
  // 何らかの処理を実行する
  return 0;
}

/* 定数オーダー */
void constant(int n) {
  // 定数、変数、オブジェクトは O(1) の領域を使用する
  final int a = 0;
  int b = 0;
  List<int> nums = List.filled(10000, 0);
  ListNode node = ListNode(0);
  // ループ内の変数は O(1) の領域を使用する
  for (var i = 0; i < n; i++) {
    int c = 0;
  }
  // ループ内の関数は O(1) の領域を使用する
  for (var i = 0; i < n; i++) {
    function();
  }
}

/* 線形オーダー */
void linear(int n) {
  // 長さ n の配列は O(n) の領域を使用する
  List<int> nums = List.filled(n, 0);
  // 長さ n のリストは O(n) の領域を使用する
  List<ListNode> nodes = [];
  for (var i = 0; i < n; i++) {
    nodes.add(ListNode(i));
  }
  // 長さ n のハッシュテーブルは O(n) の領域を使用する
  Map<int, String> map = HashMap();
  for (var i = 0; i < n; i++) {
    map.putIfAbsent(i, () => i.toString());
  }
}

/* 線形オーダー（再帰による実装） */
void linearRecur(int n) {
  print('再帰 n = $n');
  if (n == 1) return;
  linearRecur(n - 1);
}

/* 二次オーダー */
void quadratic(int n) {
  // 行列は O(n^2) の領域を使用する
  List<List<int>> numMatrix = List.generate(n, (_) => List.filled(n, 0));
  // 二次元リストは O(n^2) の領域を使用する
  List<List<int>> numList = [];
  for (var i = 0; i < n; i++) {
    List<int> tmp = [];
    for (int j = 0; j < n; j++) {
      tmp.add(0);
    }
    numList.add(tmp);
  }
}

/* 二次オーダー（再帰による実装） */
int quadraticRecur(int n) {
  if (n <= 0) return 0;
  List<int> nums = List.filled(n, 0);
  print('再帰 n = $n における nums の長さ = ${nums.length}');
  return quadraticRecur(n - 1);
}

/* 指数オーダー（パーフェクト二分木の構築） */
TreeNode? buildTree(int n) {
  if (n == 0) return null;
  TreeNode root = TreeNode(0);
  root.left = buildTree(n - 1);
  root.right = buildTree(n - 1);
  return root;
}

/* 実行用コード */
void main() {
  int n = 5;
  // 定数オーダー
  constant(n);
  // 線形オーダー
  linear(n);
  linearRecur(n);
  // 二次オーダー
  quadratic(n);
  quadraticRecur(n);
  // 指数オーダー
  TreeNode? root = buildTree(n);
  printTree(root);
}
