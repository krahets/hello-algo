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

  /* ノードを探索 */
  TreeNode? search(int _num) {
    TreeNode? cur = _root;
    // ループで探索し、葉ノードを越えたら抜ける
    while (cur != null) {
      // 目標ノードは cur の右部分木にある
      if (cur.val < _num)
        cur = cur.right;
      // 目標ノードは cur の左部分木にある
      else if (cur.val > _num)
        cur = cur.left;
      // 目標ノードが見つかったらループを抜ける
      else
        break;
    }
    // 目標ノードを返す
    return cur;
  }

  /* ノードを挿入 */
  void insert(int _num) {
    // 木が空なら、根ノードを初期化する
    if (_root == null) {
      _root = TreeNode(_num);
      return;
    }
    TreeNode? cur = _root;
    TreeNode? pre = null;
    // ループで探索し、葉ノードを越えたら抜ける
    while (cur != null) {
      // 重複ノードが見つかったら、直ちに返す
      if (cur.val == _num) return;
      pre = cur;
      // 挿入位置は cur の右部分木にある
      if (cur.val < _num)
        cur = cur.right;
      // 挿入位置は cur の左部分木にある
      else
        cur = cur.left;
    }
    // ノードを挿入
    TreeNode? node = TreeNode(_num);
    if (pre!.val < _num)
      pre.right = node;
    else
      pre.left = node;
  }

  /* ノードを削除 */
  void remove(int _num) {
    // 木が空なら、そのまま早期リターンする
    if (_root == null) return;
    TreeNode? cur = _root;
    TreeNode? pre = null;
    // ループで探索し、葉ノードを越えたら抜ける
    while (cur != null) {
      // 削除対象のノードが見つかったら、ループを抜ける
      if (cur.val == _num) break;
      pre = cur;
      // 削除対象ノードは cur の右部分木にある
      if (cur.val < _num)
        cur = cur.right;
      // 削除対象ノードは cur の左部分木にある
      else
        cur = cur.left;
    }
    // 削除対象ノードがない場合は、そのまま返す
    if (cur == null) return;
    // 子ノード数 = 0 or 1
    if (cur.left == null || cur.right == null) {
      // 子ノード数が 0 / 1 のとき、child = null / その子ノード
      TreeNode? child = cur.left ?? cur.right;
      // ノード cur を削除する
      if (cur != _root) {
        if (pre!.left == cur)
          pre.left = child;
        else
          pre.right = child;
      } else {
        // 削除ノードが根ノードなら、根ノードを再設定
        _root = child;
      }
    } else {
      // 子ノード数 = 2
      // 中順走査における cur の次のノードを取得
      TreeNode? tmp = cur.right;
      while (tmp!.left != null) {
        tmp = tmp.left;
      }
      // ノード tmp を再帰的に削除
      remove(tmp.val);
      // tmp で cur を上書きする
      cur.val = tmp.val;
    }
  }
}

/* Driver Code */
void main() {
  /* 二分探索木を初期化 */
  BinarySearchTree bst = BinarySearchTree();
  // 注意：挿入順序が異なると異なる二分木が生成される。このシーケンスからは完全二分木を生成できる
  List<int> nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
  for (int _num in nums) {
    bst.insert(_num);
  }
  print("\n初期化した二分木は\n");
  printTree(bst.getRoot());

  /* ノードを探索 */
  TreeNode? node = bst.search(7);
  print("\n見つかったノードオブジェクトは $node ，ノードの値 = ${node?.val}");

  /* ノードを挿入 */
  bst.insert(16);
  print("\nノード 16 を挿入後、二分木は\n");
  printTree(bst.getRoot());

  /* ノードを削除 */
  bst.remove(1);
  print("\nノード 1 を削除後、二分木は\n");
  printTree(bst.getRoot());
  bst.remove(2);
  print("\nノード 2 を削除後、二分木は\n");
  printTree(bst.getRoot());
  bst.remove(4);
  print("\nノード 4 を削除後、二分木は\n");
  printTree(bst.getRoot());
}
