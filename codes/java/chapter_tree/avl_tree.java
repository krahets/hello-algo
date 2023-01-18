/**
 * File: avl_tree.java
 * Created Time: 2022-12-10
 * Author: Krahets (krahets@163.com)
 */

package chapter_tree;

import include.*;

// Tree class
class AVLTree {
    TreeNode root; // 根节点

    /* 获取结点高度 */
    public int height(TreeNode node) {
        // 空结点高度为 -1 ，叶结点高度为 0
        return node == null ? -1 : node.height;
    }

    /* 更新结点高度 */
    private void updateHeight(TreeNode node) {
        // 结点高度等于最高子树高度 + 1
        node.height = Math.max(height(node.left), height(node.right)) + 1;
    }

    /* 获取平衡因子 */
    public int balanceFactor(TreeNode node) {
        // 空结点平衡因子为 0
        if (node == null) return 0;
        // 结点平衡因子 = 左子树高度 - 右子树高度
        return height(node.left) - height(node.right);
    }

    /* 右旋操作 */
    private TreeNode rightRotate(TreeNode node) {
        TreeNode child = node.left;
        TreeNode grandChild = child.right;
        // 以 child 为原点，将 node 向右旋转
        child.right = node;
        node.left = grandChild;
        // 更新结点高度
        updateHeight(node);
        updateHeight(child);
        // 返回旋转后子树的根节点
        return child;
    }

    /* 左旋操作 */
    private TreeNode leftRotate(TreeNode node) {
        TreeNode child = node.right;
        TreeNode grandChild = child.left;
        // 以 child 为原点，将 node 向左旋转
        child.left = node;
        node.right = grandChild;
        // 更新结点高度
        updateHeight(node);
        updateHeight(child);
        // 返回旋转后子树的根节点
        return child;
    }

    /* 执行旋转操作，使该子树重新恢复平衡 */
    private TreeNode rotate(TreeNode node) {
        // 获取结点 node 的平衡因子
        int balanceFactor = balanceFactor(node);
        // 左偏树
        if (balanceFactor > 1) {
            if (balanceFactor(node.left) >= 0) {
                // 右旋
                return rightRotate(node);
            } else {
                // 先左旋后右旋
                node.left = leftRotate(node.left);
                return rightRotate(node);
            }
        }
        // 右偏树
        if (balanceFactor < -1) {
            if (balanceFactor(node.right) <= 0) {
                // 左旋
                return leftRotate(node);
            } else {
                // 先右旋后左旋
                node.right = rightRotate(node.right);
                return leftRotate(node);
            }
        }
        // 平衡树，无需旋转，直接返回
        return node;
    }

    /* 插入结点 */
    public TreeNode insert(int val) {
        root = insertHelper(root, val);
        return root;
    }

    /* 递归插入结点（辅助函数） */
    private TreeNode insertHelper(TreeNode node, int val) {
        if (node == null) return new TreeNode(val);
        /* 1. 查找插入位置，并插入结点 */
        if (val < node.val)
            node.left = insertHelper(node.left, val);
        else if (val > node.val)
            node.right = insertHelper(node.right, val);
        else
            return node;     // 重复结点不插入，直接返回
        updateHeight(node);  // 更新结点高度
        /* 2. 执行旋转操作，使该子树重新恢复平衡 */
        node = rotate(node);
        // 返回子树的根节点
        return node;
    }

    /* 删除结点 */
    public TreeNode remove(int val) {
        root = removeHelper(root, val);
        return root;
    }

    /* 递归删除结点（辅助函数） */
    private TreeNode removeHelper(TreeNode node, int val) {
        if (node == null) return null;
        /* 1. 查找结点，并删除之 */
        if (val < node.val)
            node.left = removeHelper(node.left, val);
        else if (val > node.val)
            node.right = removeHelper(node.right, val);
        else {
            if (node.left == null || node.right == null) {
                TreeNode child = node.left != null ? node.left : node.right;
                // 子结点数量 = 0 ，直接删除 node 并返回
                if (child == null)
                    return null;
                // 子结点数量 = 1 ，直接删除 node
                else
                    node = child;
            } else {
                // 子结点数量 = 2 ，则将中序遍历的下个结点删除，并用该结点替换当前结点
                TreeNode temp = getInOrderNext(node.right);
                node.right = removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        updateHeight(node);  // 更新结点高度
        /* 2. 执行旋转操作，使该子树重新恢复平衡 */
        node = rotate(node);
        // 返回子树的根节点
        return node;
    }

    /* 获取中序遍历中的下一个结点（仅适用于 root 有左子结点的情况） */
    private TreeNode getInOrderNext(TreeNode node) {
        if (node == null) return node;
        // 循环访问左子结点，直到叶结点时为最小结点，跳出
        while (node.left != null) {
            node = node.left;
        }
        return node;
    }

    /* 查找结点 */
    public TreeNode search(int val) {
        TreeNode cur = root;
        // 循环查找，越过叶结点后跳出
        while (cur != null) {
            // 目标结点在 cur 的右子树中
            if (cur.val < val)
                cur = cur.right;
            // 目标结点在 cur 的左子树中
            else if (cur.val > val)
                cur = cur.left;
            // 找到目标结点，跳出循环
            else
                break;
        }
        // 返回目标结点
        return cur;
    }
}

public class avl_tree {
    static void testInsert(AVLTree tree, int val) {
        tree.insert(val);
        System.out.println("\n插入结点 " + val + " 后，AVL 树为");
        PrintUtil.printTree(tree.root);
    }

    static void testRemove(AVLTree tree, int val) {
        tree.remove(val);
        System.out.println("\n删除结点 " + val + " 后，AVL 树为");
        PrintUtil.printTree(tree.root);
    }

    public static void main(String[] args) {
        /* 初始化空 AVL 树 */
        AVLTree avlTree = new AVLTree();

        /* 插入结点 */
        // 请关注插入结点后，AVL 树是如何保持平衡的
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

        /* 插入重复结点 */
        testInsert(avlTree, 7);

        /* 删除结点 */
        // 请关注删除结点后，AVL 树是如何保持平衡的
        testRemove(avlTree, 8); // 删除度为 0 的结点
        testRemove(avlTree, 5); // 删除度为 1 的结点
        testRemove(avlTree, 4); // 删除度为 2 的结点

        /* 查询结点 */
        TreeNode node = avlTree.search(7);
        System.out.println("\n查找到的结点对象为 " + node + "，结点值 = " + node.val);
    }
}
