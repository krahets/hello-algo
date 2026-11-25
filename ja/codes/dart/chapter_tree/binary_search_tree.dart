/**
 * File: binary_search_tree.dart
 * Created Time: 2023-04-04
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 二分探索木 */
class BinarySearchTree {
  late TreeNode? _root;

  /* コンストラクタ */
  BinarySearchTree() {
    // 空の木を初期化する
    _root = null;
  }

  /* 二分木の根を取得する */
  TreeNode? getRoot() {
    return _root;
  }

  /* ノードを探索する */
  TreeNode? search(int _num) {
    TreeNode? cur = _root;
    // ループで探索し、葉を越えたら終了する
    while (cur != null) {
      // 目的のノードは cur の右部分木にある
      if (cur.val < _num)
        cur = cur.right;
      // 目的のノードは cur の左部分木にある
      else if (cur.val > _num)
        cur = cur.left;
      // 目的のノードが見つかったのでループを抜ける
      else
        break;
    }
    // 目的のノードを返す
    return cur;
  }

  /* ノードを挿入する */
  void insert(int _num) {
    // 木が空なら根を初期化する
    if (_root == null) {
      _root = TreeNode(_num);
      return;
    }
    TreeNode? cur = _root;
    TreeNode? pre = null;
    // ループで探索し、葉を越えたら終了する
    while (cur != null) {
      // 値が重複するノードが見つかったらそのまま戻る
      if (cur.val == _num) return;
      pre = cur;
      // 挿入位置は cur の右部分木にある
      if (cur.val < _num)
        cur = cur.right;
      // 挿入位置は cur の左部分木にある
      else
        cur = cur.left;
    }
    // ノードを挿入する
    TreeNode? node = TreeNode(_num);
    if (pre!.val < _num)
      pre.right = node;
    else
      pre.left = node;
  }

  /* ノードを削除する */
  void remove(int _num) {
    // 木が空ならすぐに戻る
    if (_root == null) return;
    TreeNode? cur = _root;
    TreeNode? pre = null;
    // ループで探索し、葉を越えたら終了する
    while (cur != null) {
      // 削除対象のノードが見つかったのでループを抜ける
      if (cur.val == _num) break;
      pre = cur;
      // 削除対象は cur の右部分木にある
      if (cur.val < _num)
        cur = cur.right;
      // 削除対象は cur の左部分木にある
      else
        cur = cur.left;
    }
    // 削除対象がなければそのまま戻る
    if (cur == null) return;
    // 子が 0 個または 1 個
    if (cur.left == null || cur.right == null) {
      // 子が 0 個なら child = null、1 個なら child はその子
      TreeNode? child = cur.left ?? cur.right;
      // ノード cur を削除する
      if (cur != _root) {
        if (pre!.left == cur)
          pre.left = child;
        else
          pre.right = child;
      } else {
        // 削除対象が根なら根を設定し直す
        _root = child;
      }
    } else {
      // 子が 2 個
      // 通りがけ順で cur の次に来るノードを取得する
      TreeNode? tmp = cur.right;
      while (tmp!.left != null) {
        tmp = tmp.left;
      }
      // ノード tmp を再帰的に削除する
      remove(tmp.val);
      // tmp の値で cur の値を上書きする
      cur.val = tmp.val;
    }
  }
}

/* 実行例 */
void main() {
  /* 二分探索木を初期化する */
  BinarySearchTree bst = BinarySearchTree();
  // 挿入順によって木の形は変わる。この順に挿入すると完璧二分木になる
  List<int> nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
  for (int _num in nums) {
    bst.insert(_num);
  }
  print("\n初期化した二分木：\n");
  printTree(bst.getRoot());

  /* ノードを探索する */
  TreeNode? node = bst.search(7);
  print("\n見つかったノードのオブジェクト：$node、値 = ${node?.val}");

  /* ノードを挿入する */
  bst.insert(16);
  print("\nノード 16 を挿入した後の二分木：\n");
  printTree(bst.getRoot());

  /* ノードを削除する */
  bst.remove(1);
  print("\nノード 1 を削除した後の二分木：\n");
  printTree(bst.getRoot());
  bst.remove(2);
  print("\nノード 2 を削除した後の二分木：\n");
  printTree(bst.getRoot());
  bst.remove(4);
  print("\nノード 4 を削除した後の二分木：\n");
  printTree(bst.getRoot());
}
