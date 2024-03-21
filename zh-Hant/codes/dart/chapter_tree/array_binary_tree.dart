/**
 * File: array_binary_tree.dart
 * Created Time: 2023-08-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* 数组表示下的二叉树类 */
class ArrayBinaryTree {
  late List<int?> _tree;

  /* 构造方法 */
  ArrayBinaryTree(this._tree);

  /* 列表容量 */
  int size() {
    return _tree.length;
  }

  /* 获取索引为 i 节点的值 */
  int? val(int i) {
    // 若索引越界，则返回 null ，代表空位
    if (i < 0 || i >= size()) {
      return null;
    }
    return _tree[i];
  }

  /* 获取索引为 i 节点的左子节点的索引 */
  int? left(int i) {
    return 2 * i + 1;
  }

  /* 获取索引为 i 节点的右子节点的索引 */
  int? right(int i) {
    return 2 * i + 2;
  }

  /* 获取索引为 i 节点的父节点的索引 */
  int? parent(int i) {
    return (i - 1) ~/ 2;
  }

  /* 层序遍历 */
  List<int> levelOrder() {
    List<int> res = [];
    for (int i = 0; i < size(); i++) {
      if (val(i) != null) {
        res.add(val(i)!);
      }
    }
    return res;
  }

  /* 深度优先遍历 */
  void dfs(int i, String order, List<int?> res) {
    // 若为空位，则返回
    if (val(i) == null) {
      return;
    }
    // 前序遍历
    if (order == 'pre') {
      res.add(val(i));
    }
    dfs(left(i)!, order, res);
    // 中序遍历
    if (order == 'in') {
      res.add(val(i));
    }
    dfs(right(i)!, order, res);
    // 后序遍历
    if (order == 'post') {
      res.add(val(i));
    }
  }

  /* 前序遍历 */
  List<int?> preOrder() {
    List<int?> res = [];
    dfs(0, 'pre', res);
    return res;
  }

  /* 中序遍历 */
  List<int?> inOrder() {
    List<int?> res = [];
    dfs(0, 'in', res);
    return res;
  }

  /* 后序遍历 */
  List<int?> postOrder() {
    List<int?> res = [];
    dfs(0, 'post', res);
    return res;
  }
}

/* Driver Code */
void main() {
  // 初始化二叉树
  // 这里借助了一个从数组直接生成二叉树的函数
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
  print("\n初始化二叉树\n");
  print("二叉树的数组表示：");
  print(arr);
  print("二叉树的链表表示：");
  printTree(root);

  // 数组表示下的二叉树类
  ArrayBinaryTree abt = ArrayBinaryTree(arr);

  // 访问节点
  int i = 1;
  int? l = abt.left(i);
  int? r = abt.right(i);
  int? p = abt.parent(i);
  print("\n当前节点的索引为 $i ，值为 ${abt.val(i)}");
  print("其左子节点的索引为 $l ，值为 ${(l == null ? "null" : abt.val(l))}");
  print("其右子节点的索引为 $r ，值为 ${(r == null ? "null" : abt.val(r))}");
  print("其父节点的索引为 $p ，值为 ${(p == null ? "null" : abt.val(p))}");

  // 遍历树
  List<int?> res = abt.levelOrder();
  print("\n层序遍历为：$res");
  res = abt.preOrder();
  print("前序遍历为 $res");
  res = abt.inOrder();
  print("中序遍历为 $res");
  res = abt.postOrder();
  print("后序遍历为 $res");
}
