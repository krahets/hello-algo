/**
 * File: array_binary_tree.dart
 * Created Time: 2023-08-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 配列で表した二分木クラス */
class ArrayBinaryTree {
  late List<int?> _tree;

  /* コンストラクタ */
  ArrayBinaryTree(this._tree);

  /* リストの容量 */
  int size() {
    return _tree.length;
  }

  /* インデックス i のノードの値を取得する */
  int? val(int i) {
    // インデックスが範囲外の場合、空きを表す null を返す
    if (i < 0 || i >= size()) {
      return null;
    }
    return _tree[i];
  }

  /* インデックス i のノードの左の子ノードのインデックスを取得する */
  int? left(int i) {
    return 2 * i + 1;
  }

  /* インデックス i のノードの右の子ノードのインデックスを取得する */
  int? right(int i) {
    return 2 * i + 2;
  }

  /* インデックス i のノードの親ノードのインデックスを取得する */
  int? parent(int i) {
    return (i - 1) ~/ 2;
  }

  /* レベル順走査 */
  List<int> levelOrder() {
    List<int> res = [];
    for (int i = 0; i < size(); i++) {
      if (val(i) != null) {
        res.add(val(i)!);
      }
    }
    return res;
  }

  /* 深さ優先走査 */
  void dfs(int i, String order, List<int?> res) {
    // 空きの場合、戻る
    if (val(i) == null) {
      return;
    }
    // 行きがけ順走査
    if (order == 'pre') {
      res.add(val(i));
    }
    dfs(left(i)!, order, res);
    // 通りがけ順走査
    if (order == 'in') {
      res.add(val(i));
    }
    dfs(right(i)!, order, res);
    // 帰りがけ順走査
    if (order == 'post') {
      res.add(val(i));
    }
  }

  /* 行きがけ順走査 */
  List<int?> preOrder() {
    List<int?> res = [];
    dfs(0, 'pre', res);
    return res;
  }

  /* 通りがけ順走査 */
  List<int?> inOrder() {
    List<int?> res = [];
    dfs(0, 'in', res);
    return res;
  }

  /* 帰りがけ順走査 */
  List<int?> postOrder() {
    List<int?> res = [];
    dfs(0, 'post', res);
    return res;
  }
}

/* 実行用コード */
void main() {
  // 二分木を初期化する
  // ここでは配列から二分木を直接生成する関数を使う
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
  print("\n二分木を初期化する\n");
  print("二分木の配列表現：");
  print(arr);
  print("二分木の連結リスト表現：");
  printTree(root);

  // 配列で表した二分木クラス
  ArrayBinaryTree abt = ArrayBinaryTree(arr);

  // ノードにアクセスする
  int i = 1;
  int? l = abt.left(i);
  int? r = abt.right(i);
  int? p = abt.parent(i);
  print("\n現在のノードのインデックスは $i 、値は ${abt.val(i)}");
  print("左の子ノードのインデックスは $l 、値は ${(l == null ? "null" : abt.val(l))}");
  print("右の子ノードのインデックスは $r 、値は ${(r == null ? "null" : abt.val(r))}");
  print("親ノードのインデックスは $p 、値は ${(p == null ? "null" : abt.val(p))}");

  // 木を走査する
  List<int?> res = abt.levelOrder();
  print("\nレベル順走査：$res");
  res = abt.preOrder();
  print("行きがけ順走査：$res");
  res = abt.inOrder();
  print("通りがけ順走査：$res");
  res = abt.postOrder();
  print("帰りがけ順走査：$res");
}
