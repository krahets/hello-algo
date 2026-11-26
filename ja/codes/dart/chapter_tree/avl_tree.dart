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

  /* ノードの高さを取得する */
  int height(TreeNode? node) {
    // 空のノードの高さは -1、葉の高さは 0
    return node == null ? -1 : node.height;
  }

  /* ノードの高さを更新する */
  void updateHeight(TreeNode? node) {
    // ノードの高さは、左右の部分木の高さの最大値 + 1
    node!.height = max(height(node.left), height(node.right)) + 1;
  }

  /* 平衡係数を取得する */
  int balanceFactor(TreeNode? node) {
    // 空のノードの平衡係数は 0
    if (node == null) return 0;
    // ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
    return height(node.left) - height(node.right);
  }

  /* 右回転 */
  TreeNode? rightRotate(TreeNode? node) {
    TreeNode? child = node!.left;
    TreeNode? grandChild = child!.right;
    // child を軸に node を右回転する
    child.right = node;
    node.left = grandChild;
    // ノードの高さを更新する
    updateHeight(node);
    updateHeight(child);
    // 回転後の部分木の根を返す
    return child;
  }

  /* 左回転 */
  TreeNode? leftRotate(TreeNode? node) {
    TreeNode? child = node!.right;
    TreeNode? grandChild = child!.left;
    // child を軸に node を左回転する
    child.left = node;
    node.right = grandChild;
    // ノードの高さを更新する
    updateHeight(node);
    updateHeight(child);
    // 回転後の部分木の根を返す
    return child;
  }

  /* 回転して部分木の平衡を回復する */
  TreeNode? rotate(TreeNode? node) {
    // ノード node の平衡係数を取得する
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
    // 平衡なので回転せずに戻る
    return node;
  }

  /* ノードを挿入する */
  void insert(int val) {
    root = insertHelper(root, val);
  }

  /* 再帰によるノードの挿入（補助メソッド） */
  TreeNode? insertHelper(TreeNode? node, int val) {
    if (node == null) return TreeNode(val);
    /* 1. 挿入位置を探してノードを挿入する */
    if (val < node.val)
      node.left = insertHelper(node.left, val);
    else if (val > node.val)
      node.right = insertHelper(node.right, val);
    else
      return node; // 値が重複する場合は挿入せずに戻る
    updateHeight(node); // ノードの高さを更新する
    /* 2. 回転して部分木の平衡を回復する */
    node = rotate(node);
    // 部分木の根を返す
    return node;
  }

  /* ノードを削除する */
  void remove(int val) {
    root = removeHelper(root, val);
  }

  /* 再帰によるノードの削除（補助メソッド） */
  TreeNode? removeHelper(TreeNode? node, int val) {
    if (node == null) return null;
    /* 1. ノードを探して削除する */
    if (val < node.val)
      node.left = removeHelper(node.left, val);
    else if (val > node.val)
      node.right = removeHelper(node.right, val);
    else {
      if (node.left == null || node.right == null) {
        TreeNode? child = node.left ?? node.right;
        // 子が 0 個なら node を削除して戻る
        if (child == null)
          return null;
        // 子が 1 個なら node を削除する
        else
          node = child;
      } else {
        // 子が 2 個なら通りがけ順で次のノードを削除し、その値で現在のノードの値を置き換える
        TreeNode? temp = node.right;
        while (temp!.left != null) {
          temp = temp.left;
        }
        node.right = removeHelper(node.right, temp.val);
        node.val = temp.val;
      }
    }
    updateHeight(node); // ノードの高さを更新する
    /* 2. 回転して部分木の平衡を回復する */
    node = rotate(node);
    // 部分木の根を返す
    return node;
  }

  /* ノードを探索する */
  TreeNode? search(int val) {
    TreeNode? cur = root;
    // ループで探索し、葉を越えたら終了する
    while (cur != null) {
      // 目的のノードは cur の右部分木にある
      if (val < cur.val)
        cur = cur.left;
      // 目的のノードは cur の左部分木にある
      else if (val > cur.val)
        cur = cur.right;
      // 目的の値と現在のノードの値が等しい
      else
        break;
    }
    return cur;
  }
}

void testInsert(AVLTree tree, int val) {
  tree.insert(val);
  print("\nノード $val を挿入した後の AVL 木：");
  printTree(tree.root);
}

void testRemove(AVLTree tree, int val) {
  tree.remove(val);
  print("\nノード $val を削除した後の AVL 木：");
  printTree(tree.root);
}

/* 実行例 */
void main() {
  /* 空の AVL 木を初期化する */
  AVLTree avlTree = AVLTree();
  /* ノードを挿入する */
  // 挿入後に AVL 木がどのように平衡を保つかに注目
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

  /* 重複するノードを挿入する */
  testInsert(avlTree, 7);

  /* ノードを削除する */
  // 削除後に AVL 木がどのように平衡を保つかに注目
  testRemove(avlTree, 8); // 子が 0 個のノードを削除する
  testRemove(avlTree, 5); // 子が 1 個のノードを削除する
  testRemove(avlTree, 4); // 子が 2 個のノードを削除する

  /* ノードを検索する */
  TreeNode? node = avlTree.search(7);
  print("\n見つかったノードのオブジェクト：$node、値 = ${node!.val}");
}
