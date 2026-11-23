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

  /* 二分木の根ノードを取得する */
  TreeNode? getRoot() {
    return _root;
  }

  /* ノードを探索する */
  TreeNode? search(int _num) {
    TreeNode? cur = _root;
    // 繰り返し探索し、葉ノードを越えたら終了する
    while (cur != null) {
      // 目的のノードは cur の右部分木にある
      if (cur.val < _num)
        cur = cur.right;
      // 目的のノードは cur の左部分木にある
      else if (cur.val > _num)
        cur = cur.left;
      // 目的のノードが見つかったので、ループを終了する
      else
        break;
    }
    // 目的のノードを返す
    return cur;
  }

  /* ノードを挿入する */
  void insert(int _num) {
    // 木が空の場合、根ノードを初期化する
    if (_root == null) {
      _root = TreeNode(_num);
      return;
    }
    TreeNode? cur = _root;
    TreeNode? pre = null;
    // 繰り返し探索し、葉ノードを越えたら終了する
    while (cur != null) {
      // 重複したノードが見つかったので、そのまま戻る
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
    // 木が空の場合、そのまま早期リターンする
    if (_root == null) return;
    TreeNode? cur = _root;
    TreeNode? pre = null;
    // 繰り返し探索し、葉ノードを越えたら終了する
    while (cur != null) {
      // 削除対象のノードが見つかったので、ループを終了する
      if (cur.val == _num) break;
      pre = cur;
      // 削除対象のノードは cur の右部分木にある
      if (cur.val < _num)
        cur = cur.right;
      // 削除対象のノードは cur の左部分木にある
      else
        cur = cur.left;
    }
    // 削除対象のノードが存在しない場合、そのまま戻る
    if (cur == null) return;
    // 子ノード数 = 0 または 1
    if (cur.left == null || cur.right == null) {
      // 子ノード数 = 0 / 1 の場合、child = null / その子ノード
      TreeNode? child = cur.left ?? cur.right;
      // ノード cur を削除する
      if (cur != _root) {
        if (pre!.left == cur)
          pre.left = child;
        else
          pre.right = child;
      } else {
        // 削除するノードが根ノードの場合、根ノードを指定し直す
        _root = child;
      }
    } else {
      // 子ノード数 = 2
      // 通りがけ順で cur の次のノードを取得する
      TreeNode? tmp = cur.right;
      while (tmp!.left != null) {
        tmp = tmp.left;
      }
      // ノード tmp を再帰的に削除する
      remove(tmp.val);
      // tmp で cur を上書きする
      cur.val = tmp.val;
    }
  }
}

/* 実行用コード */
void main() {
  /* 二分探索木を初期化する */
  BinarySearchTree bst = BinarySearchTree();
  // 挿入順序が異なると異なる二分木になることに注意。この順序ではパーフェクト二分木を生成できる
  List<int> nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
  for (int _num in nums) {
    bst.insert(_num);
  }
  print("\n初期化した二分木\n");
  printTree(bst.getRoot());

  /* ノードを探索する */
  TreeNode? node = bst.search(7);
  print("\n見つかったノードオブジェクトは $node 、ノードの値 = ${node?.val}");

  /* ノードを挿入する */
  bst.insert(16);
  print("\nノード 16 を挿入した後の二分木\n");
  printTree(bst.getRoot());

  /* ノードを削除する */
  bst.remove(1);
  print("\nノード 1 を削除した後の二分木\n");
  printTree(bst.getRoot());
  bst.remove(2);
  print("\nノード 2 を削除した後の二分木\n");
  printTree(bst.getRoot());
  bst.remove(4);
  print("\nノード 4 を削除した後の二分木\n");
  printTree(bst.getRoot());
}
