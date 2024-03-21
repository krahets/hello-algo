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

  /* 构造方法 */
  AVLTree() {
    root = null;
  }

  /* 获取节点高度 */
  int height(TreeNode? node) {
    // 空节点高度为 -1 ，叶节点高度为 0
    return node == null ? -1 : node.height;
  }

  /* 更新节点高度 */
  void updateHeight(TreeNode? node) {
    // 节点高度等于最高子树高度 + 1
    node!.height = max(height(node.left), height(node.right)) + 1;
  }

  /* 获取平衡因子 */
  int balanceFactor(TreeNode? node) {
    // 空节点平衡因子为 0
    if (node == null) return 0;
    // 节点平衡因子 = 左子树高度 - 右子树高度
    return height(node.left) - height(node.right);
  }

  /* 右旋操作 */
  TreeNode? rightRotate(TreeNode? node) {
    TreeNode? child = node!.left;
    TreeNode? grandChild = child!.right;
    // 以 child 为原点，将 node 向右旋转
    child.right = node;
    node.left = grandChild;
    // 更新节点高度
    updateHeight(node);
    updateHeight(child);
    // 返回旋转后子树的根节点
    return child;
  }

  /* 左旋操作 */
  TreeNode? leftRotate(TreeNode? node) {
    TreeNode? child = node!.right;
    TreeNode? grandChild = child!.left;
    // 以 child 为原点，将 node 向左旋转
    child.left = node;
    node.right = grandChild;
    // 更新节点高度
    updateHeight(node);
    updateHeight(child);
    // 返回旋转后子树的根节点
    return child;
  }

  /* 执行旋转操作，使该子树重新恢复平衡 */
  TreeNode? rotate(TreeNode? node) {
    // 获取节点 node 的平衡因子
    int factor = balanceFactor(node);
    // 左偏树
    if (factor > 1) {
      if (balanceFactor(node!.left) >= 0) {
        // 右旋
        return rightRotate(node);
      } else {
        // 先左旋后右旋
        node.left = leftRotate(node.left);
        return rightRotate(node);
      }
    }
    // 右偏树
    if (factor < -1) {
      if (balanceFactor(node!.right) <= 0) {
        // 左旋
        return leftRotate(node);
      } else {
        // 先右旋后左旋
        node.right = rightRotate(node.right);
        return leftRotate(node);
      }
    }
    // 平衡树，无须旋转，直接返回
    return node;
  }

  /* 插入节点 */
  void insert(int val) {
    root = insertHelper(root, val);
  }

  /* 递归插入节点（辅助方法） */
  TreeNode? insertHelper(TreeNode? node, int val) {
    if (node == null) return TreeNode(val);
    /* 1. 查找插入位置并插入节点 */
    if (val < node.val)
      node.left = insertHelper(node.left, val);
    else if (val > node.val)
      node.right = insertHelper(node.right, val);
    else
      return node; // 重复节点不插入，直接返回
    updateHeight(node); // 更新节点高度
    /* 2. 执行旋转操作，使该子树重新恢复平衡 */
    node = rotate(node);
    // 返回子树的根节点
    return node;
  }

  /* 删除节点 */
  void remove(int val) {
    root = removeHelper(root, val);
  }

  /* 递归删除节点（辅助方法） */
  TreeNode? removeHelper(TreeNode? node, int val) {
    if (node == null) return null;
    /* 1. 查找节点并删除 */
    if (val < node.val)
      node.left = removeHelper(node.left, val);
    else if (val > node.val)
      node.right = removeHelper(node.right, val);
    else {
      if (node.left == null || node.right == null) {
        TreeNode? child = node.left ?? node.right;
        // 子节点数量 = 0 ，直接删除 node 并返回
        if (child == null)
          return null;
        // 子节点数量 = 1 ，直接删除 node
        else
          node = child;
      } else {
        // 子节点数量 = 2 ，则将中序遍历的下个节点删除，并用该节点替换当前节点
        TreeNode? temp = node.right;
        while (temp!.left != null) {
          temp = temp.left;
        }
        node.right = removeHelper(node.right, temp.val);
        node.val = temp.val;
      }
    }
    updateHeight(node); // 更新节点高度
    /* 2. 执行旋转操作，使该子树重新恢复平衡 */
    node = rotate(node);
    // 返回子树的根节点
    return node;
  }

  /* 查找节点 */
  TreeNode? search(int val) {
    TreeNode? cur = root;
    // 循环查找，越过叶节点后跳出
    while (cur != null) {
      // 目标节点在 cur 的右子树中
      if (val < cur.val)
        cur = cur.left;
      // 目标节点在 cur 的左子树中
      else if (val > cur.val)
        cur = cur.right;
      // 目标节点与当前节点相等
      else
        break;
    }
    return cur;
  }
}

void testInsert(AVLTree tree, int val) {
  tree.insert(val);
  print("\n插入节点 $val 后，AVL 树为");
  printTree(tree.root);
}

void testRemove(AVLTree tree, int val) {
  tree.remove(val);
  print("\n删除节点 $val 后，AVL 树为");
  printTree(tree.root);
}

/* Driver Code */
void main() {
  /* 初始化空 AVL 树 */
  AVLTree avlTree = AVLTree();
  /* 插入节点 */
  // 请关注插入节点后，AVL 树是如何保持平衡的
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

  /* 插入重复节点 */
  testInsert(avlTree, 7);

  /* 删除节点 */
  // 请关注删除节点后，AVL 树是如何保持平衡的
  testRemove(avlTree, 8); // 删除度为 0 的节点
  testRemove(avlTree, 5); // 删除度为 1 的节点
  testRemove(avlTree, 4); // 删除度为 2 的节点

  /* 查询节点 */
  TreeNode? node = avlTree.search(7);
  print("\n查找到的节点对象为 $node ，节点值 = ${node!.val}");
}
