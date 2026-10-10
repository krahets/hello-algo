/**
 * File: array_binary_tree.dart
 * Created Time: 2023-08-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 配列表現による二分木クラス */
class ArrayBinaryTree {
  late List<int?> _tree;

  /* コンストラクタ */
  ArrayBinaryTree(this._tree);

  /* リスト容量 */
  int size() {
    return _tree.length;
  }

  /* インデックス i のノードの値を取得 */
  int? val(int i) {
    // インデックスが範囲外なら、空きを表す null を返す
    if (i < 0 || i >= size()) {
      return null;
    }
    return _tree[i];
  }

  /* インデックス i のノードの左子ノードのインデックスを取得 */
  int? left(int i) {
    return 2 * i + 1;
  }

  /* インデックス i のノードの右子ノードのインデックスを取得 */
  int? right(int i) {
    return 2 * i + 2;
  }

  /* インデックス i のノードの親ノードのインデックスを取得 */
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

  /* 深さ優先探索 */
  void dfs(int i, String order, List<int?> res) {
    // 空きスロットなら返す
    if (val(i) == null) {
      return;
    }
    // 先行順走査
    if (order == 'pre') {
      res.add(val(i));
    }
    dfs(left(i)!, order, res);
    // 中順走査
    if (order == 'in') {
      res.add(val(i));
    }
    dfs(right(i)!, order, res);
    // 後順走査
    if (order == 'post') {
      res.add(val(i));
    }
  }

  /* 先行順走査 */
  List<int?> preOrder() {
    List<int?> res = [];
    dfs(0, 'pre', res);
    return res;
  }

  /* 中順走査 */
  List<int?> inOrder() {
    List<int?> res = [];
    dfs(0, 'in', res);
    return res;
  }

  /* 後順走査 */
  List<int?> postOrder() {
    List<int?> res = [];
    dfs(0, 'post', res);
    return res;
  }
}

/* Driver Code */
void main() {
  // 二分木を初期化
  // ここでは、配列から直接二分木を生成する関数を利用する
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
  print("\n二分木を初期化\n");
  print("二分木の配列表現：");
  print(arr);
  print("二分木の連結リスト表現：");
  printTree(root);

  // 配列表現による二分木クラス
  ArrayBinaryTree abt = ArrayBinaryTree(arr);

  // ノードにアクセス
  int i = 1;
  int? l = abt.left(i);
  int? r = abt.right(i);
  int? p = abt.parent(i);
  print("\n現在のノードのインデックスは $i ，値は ${abt.val(i)}");
  print("その左子ノードのインデックスは $l ，値は ${(l == null ? "null" : abt.val(l))}");
  print("その右子ノードのインデックスは $r ，値は ${(r == null ? "null" : abt.val(r))}");
  print("その親ノードのインデックスは $p ，値は ${(p == null ? "null" : abt.val(p))}");

  // 木を走査
  List<int?> res = abt.levelOrder();
  print("\nレベル順走査：$res");
  res = abt.preOrder();
  print("先行順走査は $res");
  res = abt.inOrder();
  print("中間順走査は $res");
  res = abt.postOrder();
  print("後行順走査は $res");
}
