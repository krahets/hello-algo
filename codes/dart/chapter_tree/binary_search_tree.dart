/**
 * File: binary_search_tree.dart
 * Created Time: 2023-04-04
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 二叉搜索树 */
class BinarySearchTree {
  late TreeNode? _root;

  /* 构造方法 */
  BinarySearchTree(List<int> nums) {
    nums.sort(); // 排序数组
    _root = buildTree(nums, 0, nums.length - 1); // 构建二叉搜索树
  }

  /* 获取二叉树的根节点 */
  TreeNode? getRoot() {
    return _root;
  }

  /* 构建二叉上搜索树 */
  TreeNode? buildTree(List<int> nums, int i, int j) {
    if (i > j) {
      return null;
    }
    // 将数组中间节点作为根节点
    int mid = (i + j) ~/ 2;
    TreeNode? root = TreeNode(nums[mid]);
    root.left = buildTree(nums, i, mid - 1);
    root.right = buildTree(nums, mid + 1, j);
    return root;
  }

  /* 查找节点 */
  TreeNode? search(int num) {
    TreeNode? cur = _root;
    // 循环查找，越过叶节点后跳出
    while (cur != null) {
      // 目标节点在 cur 的右子树中
      if (cur.val < num)
        cur = cur.right;
      // 目标节点在 cur 的左子树中
      else if (cur.val > num)
        cur = cur.left;
      // 找到目标节点，跳出循环
      else
        break;
    }
    // 返回目标节点
    return cur;
  }

  /* 插入节点 */
  void insert(int num) {
    // 若树为空，直接提前返回
    if (_root == null) return;
    TreeNode? cur = _root;
    TreeNode? pre = null;
    // 循环查找，越过叶节点后跳出
    while (cur != null) {
      // 找到重复节点，直接返回
      if (cur.val == num) return;
      pre = cur;
      // 插入位置在 cur 的右子树中
      if (cur.val < num)
        cur = cur.right;
      // 插入位置在 cur 的左子树中
      else
        cur = cur.left;
    }
    // 插入节点
    TreeNode? node = TreeNode(num);
    if (pre!.val < num)
      pre.right = node;
    else
      pre.left = node;
  }

/* 删除节点 */
  void remove(int num) {
    // 若树为空，直接提前返回
    if (_root == null) return;

    TreeNode? cur = _root;
    TreeNode? pre = null;
    // 循环查找，越过叶节点后跳出
    while (cur != null) {
      // 找到待删除节点，跳出循环
      if (cur.val == num) break;
      pre = cur;
      // 待删除节点在 cur 的右子树中
      if (cur.val < num)
        cur = cur.right;
      // 待删除节点在 cur 的左子树中
      else
        cur = cur.left;
    }
    // 若无待删除节点，直接返回
    if (cur == null) return;
    // 子节点数量 = 0 or 1
    if (cur.left == null || cur.right == null) {
      // 当子节点数量 = 0 / 1 时， child = null / 该子节点
      TreeNode? child = cur.left ?? cur.right;
      // 删除节点 cur
      if (cur != _root) {
        if (pre!.left == cur)
          pre.left = child;
        else
          pre.right = child;
      } else {
        // 若删除节点为根节点，则重新指定根节点
        _root = child;
      }
    } else {
      // 子节点数量 = 2
      // 获取中序遍历中 cur 的下一个节点
      TreeNode? tmp = cur.right;
      while (tmp!.left != null) {
        tmp = tmp.left;
      }
      // 递归删除节点 tmp
      remove(tmp.val);
      // 用 tmp 覆盖 cur
      cur.val = tmp.val;
    }
  }
}

/* Driver Code */
void main() {
  /* 初始化二叉搜索树 */
  List<int> nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  BinarySearchTree bst = BinarySearchTree(nums);
  print("\n初始化的二叉树为\n");
  printTree(bst.getRoot());

  /* 查找节点 */
  TreeNode? node = bst.search(7);
  print("\n查找到的节点对象为 $node，节点值 = ${node?.val}");

  /* 插入节点 */
  bst.insert(16);
  print("\n插入节点 16 后，二叉树为\n");
  printTree(bst.getRoot());

  /* 删除节点 */
  bst.remove(1);
  print("\n删除节点 1 后，二叉树为\n");
  printTree(bst.getRoot());
  bst.remove(2);
  print("\n删除节点 2 后，二叉树为\n");
  printTree(bst.getRoot());
  bst.remove(4);
  print("\n删除节点 4 后，二叉树为\n");
  printTree(bst.getRoot());
}
