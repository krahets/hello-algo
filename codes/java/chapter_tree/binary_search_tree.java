/**
 * File: binary_search_tree.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;

/* 二叉搜索树 */
class BinarySearchTree {
    private TreeNode root;

    /* 构造方法 */
    public BinarySearchTree() {
        // 初始化空树
        root = null;
    }

    /* 获取二叉树根节点 */
    public TreeNode getRoot() {
        return root;
    }

    /* 查找节点 */
    public TreeNode search(int num) {
        TreeNode cur = root;
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
    public void insert(int num) {
        // 若树为空，则初始化根节点
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode cur = root, pre = null;
        // 循环查找，越过叶节点后跳出
        while (cur != null) {
            // 找到重复节点，直接返回
            if (cur.val == num)
                return;
            pre = cur;
            // 插入位置在 cur 的右子树中
            if (cur.val < num)
                cur = cur.right;
            // 插入位置在 cur 的左子树中
            else
                cur = cur.left;
        }
        // 插入节点
        TreeNode node = new TreeNode(num);
        if (pre.val < num)
            pre.right = node;
        else
            pre.left = node;
    }

    /* 删除节点 */
    public void remove(int num) {
        // 若树为空，直接提前返回
        if (root == null)
            return;
        TreeNode cur = root, pre = null;
        // 循环查找，越过叶节点后跳出
        while (cur != null) {
            // 找到待删除节点，跳出循环
            if (cur.val == num)
                break;
            pre = cur;
            // 待删除节点在 cur 的右子树中
            if (cur.val < num)
                cur = cur.right;
            // 待删除节点在 cur 的左子树中
            else
                cur = cur.left;
        }
        // 若无待删除节点，则直接返回
        if (cur == null)
            return;
        // 子节点数量 = 0 or 1
        if (cur.left == null || cur.right == null) {
            // 当子节点数量 = 0 / 1 时， child = null / 该子节点
            TreeNode child = cur.left != null ? cur.left : cur.right;
            // 删除节点 cur
            if (cur != root) {
                if (pre.left == cur)
                    pre.left = child;
                else
                    pre.right = child;
            } else {
                // 若删除节点为根节点，则重新指定根节点
                root = child;
            }
        }
        // 子节点数量 = 2
        else {
            // 获取中序遍历中 cur 的下一个节点
            TreeNode tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // 递归删除节点 tmp
            remove(tmp.val);
            // 用 tmp 覆盖 cur
            cur.val = tmp.val;
        }
    }
}

public class binary_search_tree {
    public static void main(String[] args) {
        /* 初始化二叉搜索树 */
        BinarySearchTree bst = new BinarySearchTree();
        // 请注意，不同的插入顺序会生成不同的二叉树，该序列可以生成一个完美二叉树
        int[] nums = { 8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15 };
        for (int num : nums) {
            bst.insert(num);
        }
        System.out.println("\n初始化的二叉树为\n");
        PrintUtil.printTree(bst.getRoot());

        /* 查找节点 */
        TreeNode node = bst.search(7);
        System.out.println("\n查找到的节点对象为 " + node + "，节点值 = " + node.val);

        /* 插入节点 */
        bst.insert(16);
        System.out.println("\n插入节点 16 后，二叉树为\n");
        PrintUtil.printTree(bst.getRoot());

        /* 删除节点 */
        bst.remove(1);
        System.out.println("\n删除节点 1 后，二叉树为\n");
        PrintUtil.printTree(bst.getRoot());
        bst.remove(2);
        System.out.println("\n删除节点 2 后，二叉树为\n");
        PrintUtil.printTree(bst.getRoot());
        bst.remove(4);
        System.out.println("\n删除节点 4 后，二叉树为\n");
        PrintUtil.printTree(bst.getRoot());
    }
}
