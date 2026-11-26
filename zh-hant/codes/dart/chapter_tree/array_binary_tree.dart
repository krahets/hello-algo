/**
 * File: array_binary_tree.dart
 * Created Time: 2023-08-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 以陣列表示二元樹的類別 */
class ArrayBinaryTree {
  late List<int?> _tree;

  /* 建構方法 */
  ArrayBinaryTree(this._tree);

  /* 串列長度 */
  int size() {
    return _tree.length;
  }

  /* 取得索引 i 處的節點值 */
  int? val(int i) {
    // 若索引超出範圍，回傳 null 表示空位
    if (i < 0 || i >= size()) {
      return null;
    }
    return _tree[i];
  }

  /* 取得索引 i 處節點的左子節點索引 */
  int? left(int i) {
    return 2 * i + 1;
  }

  /* 取得索引 i 處節點的右子節點索引 */
  int? right(int i) {
    return 2 * i + 2;
  }

  /* 取得索引 i 處節點的父節點索引 */
  int? parent(int i) {
    return (i - 1) ~/ 2;
  }

  /* 層序走訪 */
  List<int> levelOrder() {
    List<int> res = [];
    for (int i = 0; i < size(); i++) {
      if (val(i) != null) {
        res.add(val(i)!);
      }
    }
    return res;
  }

  /* 深度優先走訪 */
  void dfs(int i, String order, List<int?> res) {
    // 若為空位，直接返回
    if (val(i) == null) {
      return;
    }
    // 前序走訪
    if (order == 'pre') {
      res.add(val(i));
    }
    dfs(left(i)!, order, res);
    // 中序走訪
    if (order == 'in') {
      res.add(val(i));
    }
    dfs(right(i)!, order, res);
    // 後序走訪
    if (order == 'post') {
      res.add(val(i));
    }
  }

  /* 前序走訪 */
  List<int?> preOrder() {
    List<int?> res = [];
    dfs(0, 'pre', res);
    return res;
  }

  /* 中序走訪 */
  List<int?> inOrder() {
    List<int?> res = [];
    dfs(0, 'in', res);
    return res;
  }

  /* 後序走訪 */
  List<int?> postOrder() {
    List<int?> res = [];
    dfs(0, 'post', res);
    return res;
  }
}

/* 主程式 */
void main() {
  // 初始化二元樹
  // 這裡使用能從陣列直接建立二元樹的函式
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
  print("\n初始化二元樹\n");
  print("二元樹的陣列表示法：");
  print(arr);
  print("二元樹的鏈結串列表示法：");
  printTree(root);

  // 以陣列表示二元樹的類別
  ArrayBinaryTree abt = ArrayBinaryTree(arr);

  // 存取節點
  int i = 1;
  int? l = abt.left(i);
  int? r = abt.right(i);
  int? p = abt.parent(i);
  print("\n目前節點的索引為 $i，值為 ${abt.val(i)}");
  print("其左子節點的索引為 $l，值為 ${(l == null ? "null" : abt.val(l))}");
  print("其右子節點的索引為 $r，值為 ${(r == null ? "null" : abt.val(r))}");
  print("其父節點的索引為 $p，值為 ${(p == null ? "null" : abt.val(p))}");

  // 走訪樹
  List<int?> res = abt.levelOrder();
  print("\n層序走訪的結果：$res");
  res = abt.preOrder();
  print("前序走訪的結果為 $res");
  res = abt.inOrder();
  print("中序走訪的結果為 $res");
  res = abt.postOrder();
  print("後序走訪的結果為 $res");
}
