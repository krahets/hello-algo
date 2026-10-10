/**
 * File: avl_tree.dart
 * Created Time: 2023-04-04
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:math';
import '../utils/print_util.dart';
import '../utils/tree_node.dart';

class AVLTree {
  TreeNode? root;

  /* コンストラクタ */
  AVLTree() {
    root = null;
  }

  /* ノードの高さを取得 */
  int height(TreeNode? node) {
    // 空ノードの高さは -1、葉ノードの高さは 0
    return node == null ? -1 : node.height;
  }

  /* ノードの高さを更新する */
  void updateHeight(TreeNode? node) {
    // ノードの高さは最も高い部分木の高さ + 1 に等しい
    node!.height = max(height(node.left), height(node.right)) + 1;
  }

  /* 平衡係数を取得 */
  int balanceFactor(TreeNode? node) {
    // 空ノードの平衡係数は 0
    if (node == null) return 0;
    // ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
    return height(node.left) - height(node.right);
  }

  /* 右回転 */
  TreeNode? rightRotate(TreeNode? node) {
    TreeNode? child = node!.left;
    TreeNode? grandChild = child!.right;
    // child を支点として node を右回転させる
    child.right = node;
    node.left = grandChild;
    // ノードの高さを更新する
    updateHeight(node);
    updateHeight(child);
    // 回転後の部分木の根ノードを返す
    return child;
  }

  /* 左回転 */
  TreeNode? leftRotate(TreeNode? node) {
    TreeNode? child = node!.right;
    TreeNode? grandChild = child!.left;
    // child を支点として node を左回転させる
    child.left = node;
    node.right = grandChild;
    // ノードの高さを更新する
    updateHeight(node);
    updateHeight(child);
    // 回転後の部分木の根ノードを返す
    return child;
  }

  /* 回転操作を行い、この部分木の平衡を回復する */
  TreeNode? rotate(TreeNode? node) {
    // ノード node の平衡係数を取得
    int factor = balanceFactor(node);
    // 左に偏った木
    if (factor > 1) {
      if (balanceFactor(node!.left) >= 0) {
        // 右回転
        return rightRotate(node);
      } else {
        // 左回転してから右回転
        node.left = leftRotate(node.left);
        return rightRotate(node);
      }
    }
    // 右に偏った木
    if (factor < -1) {
      if (balanceFactor(node!.right) <= 0) {
        // 左回転
        return leftRotate(node);
      } else {
        // 右回転してから左回転
        node.right = rightRotate(node.right);
        return leftRotate(node);
      }
    }
    // 平衡木なので回転不要、そのまま返す
    return node;
  }

  /* ノードを挿入 */
  void insert(int val) {
    root = insertHelper(root, val);
  }

  /* ノードを再帰的に挿入する（補助メソッド） */
  TreeNode? insertHelper(TreeNode? node, int val) {
    if (node == null) return TreeNode(val);
    /* 1. 挿入位置を探索してノードを挿入 */
    if (val < node.val)
      node.left = insertHelper(node.left, val);
    else if (val > node.val)
      node.right = insertHelper(node.right, val);
    else
      return node; // 重複ノードは挿入せず、そのまま返す
    updateHeight(node); // ノードの高さを更新する
    /* 2. 回転操作を行い、部分木の平衡を回復する */
    node = rotate(node);
    // 部分木の根ノードを返す
    return node;
  }

  /* ノードを削除 */
  void remove(int val) {
    root = removeHelper(root, val);
  }

  /* ノードを再帰的に削除する（補助メソッド） */
  TreeNode? removeHelper(TreeNode? node, int val) {
    if (node == null) return null;
    /* 1. ノードを探索して削除 */
    if (val < node.val)
      node.left = removeHelper(node.left, val);
    else if (val > node.val)
      node.right = removeHelper(node.right, val);
    else {
      if (node.left == null || node.right == null) {
        TreeNode? child = node.left ?? node.right;
        // 子ノード数 = 0 の場合、node をそのまま削除して返す
        if (child == null)
          return null;
        // 子ノード数 = 1 の場合、node をそのまま削除する
        else
          node = child;
      } else {
        // 子ノード数 = 2 の場合、中順走査の次のノードを削除し、そのノードで現在のノードを置き換える
        TreeNode? temp = node.right;
        while (temp!.left != null) {
          temp = temp.left;
        }
        node.right = removeHelper(node.right, temp.val);
        node.val = temp.val;
      }
    }
    updateHeight(node); // ノードの高さを更新する
    /* 2. 回転操作を行い、部分木の平衡を回復する */
    node = rotate(node);
    // 部分木の根ノードを返す
    return node;
  }

  /* ノードを探索 */
  TreeNode? search(int val) {
    TreeNode? cur = root;
    // ループで探索し、葉ノードを越えたら抜ける
    while (cur != null) {
      // 目標ノードは cur の右部分木にある
      if (val < cur.val)
        cur = cur.left;
      // 目標ノードは cur の左部分木にある
      else if (val > cur.val)
        cur = cur.right;
      // 対象ノードが現在のノードと等しい
      else
        break;
    }
    return cur;
  }
}

void testInsert(AVLTree tree, int val) {
  tree.insert(val);
  print("\nノード $val を挿入後、AVL 木は");
  printTree(tree.root);
}

void testRemove(AVLTree tree, int val) {
  tree.remove(val);
  print("\nノード $val を削除後、AVL 木は");
  printTree(tree.root);
}

/* Driver Code */
void main() {
  /* 空の AVL 木を初期化する */
  AVLTree avlTree = AVLTree();
  /* ノードを挿入 */
  // ノード挿入後に AVL 木がどのように平衡を保つかに注目してほしい
  testInsert(avlTree, 1);
  testInsert(avlTree, 2);
  testInsert(avlTree, 3);
  testInsert(avlTree, 4);
  testInsert(avlTree, 5);
  testInsert(avlTree, 8);
  testInsert(avlTree, 7);
  testInsert(avlTree, 9);
  testInsert(avlTree, 10);
  testInsert(avlTree, 6);

  /* 重複ノードを挿入する */
  testInsert(avlTree, 7);

  /* ノードを削除 */
  // ノード削除後に AVL 木がどのように平衡を保つかに注目してほしい
  testRemove(avlTree, 8); // 次数 0 のノードを削除する
  testRemove(avlTree, 5); // 次数 1 のノードを削除する
  testRemove(avlTree, 4); // 次数 2 のノードを削除する

  /* ノードを検索 */
  TreeNode? node = avlTree.search(7);
  print("\n見つかったノードオブジェクトは $node ，ノードの値 = ${node!.val}");
}
