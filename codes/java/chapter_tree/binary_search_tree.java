/**
 * File: binary_search_tree.java
 * Created Time: 2022-11-25
 * Author: Krahets (krahets@163.com)
 */

package chapter_tree;

import java.util.*;
import include.*;

/* 二叉搜索树 */
class BinarySearchTree {
    private TreeNode root;

    public BinarySearchTree(int[] nums) {
        Arrays.sort(nums); // 排序数组
        root = buildTree(nums, 0, nums.length - 1);  // 构建二叉搜索树
    }

    /* 获取二叉树根结点 */
    public TreeNode getRoot() {
        return root;
    }

    /* 构建二叉搜索树 */
    public TreeNode buildTree(int[] nums, int i, int j) {
        if (i > j) return null;
        // 将数组中间结点作为根结点
        int mid = (i + j) / 2;
        TreeNode root = new TreeNode(nums[mid]);
        // 递归建立左子树和右子树
        root.left = buildTree(nums, i, mid - 1);
        root.right = buildTree(nums, mid + 1, j);
        return root;
    }

    /* 查找结点 */
    public TreeNode search(int num) {
        TreeNode cur = root;
        // 循环查找，越过叶结点后跳出
        while (cur != null) {
            // 目标结点在 cur 的右子树中
            if (cur.val < num) cur = cur.right;
            // 目标结点在 cur 的左子树中
            else if (cur.val > num) cur = cur.left;
            // 找到目标结点，跳出循环
            else break;
        }
        // 返回目标结点
        return cur;
    }

    /* 插入结点 */
    public TreeNode insert(int num) {
        // 若树为空，直接提前返回
        if (root == null) return null;
        TreeNode cur = root, pre = null;
        // 循环查找，越过叶结点后跳出
        while (cur != null) {
            // 找到重复结点，直接返回
            if (cur.val == num) return null;
            pre = cur;
            // 插入位置在 cur 的右子树中
            if (cur.val < num) cur = cur.right;
            // 插入位置在 cur 的左子树中
            else cur = cur.left;
        }
        // 插入结点 val
        TreeNode node = new TreeNode(num);
        if (pre.val < num) pre.right = node;
        else pre.left = node;
        return node;
    }

    /* 删除结点 */
    public TreeNode remove(int num) {
        // 若树为空，直接提前返回
        if (root == null) return null;
        TreeNode cur = root, pre = null;
        // 循环查找，越过叶结点后跳出
        while (cur != null) {
            // 找到待删除结点，跳出循环
            if (cur.val == num) break;
            pre = cur;
            // 待删除结点在 cur 的右子树中
            if (cur.val < num) cur = cur.right;
            // 待删除结点在 cur 的左子树中
            else cur = cur.left;
        }
        // 若无待删除结点，则直接返回
        if (cur == null) return null;
        // 子结点数量 = 0 or 1
        if (cur.left == null || cur.right == null) {
            // 当子结点数量 = 0 / 1 时， child = null / 该子结点
            TreeNode child = cur.left != null ? cur.left : cur.right;
            // 删除结点 cur
            if (pre.left == cur) pre.left = child;
            else pre.right = child;
        }
        // 子结点数量 = 2
        else {
            // 获取中序遍历中 cur 的下一个结点
            TreeNode nex = getInOrderNext(cur.right);
            int tmp = nex.val;
            // 递归删除结点 nex
            remove(nex.val);
            // 将 nex 的值复制给 cur
            cur.val = tmp;
        }
        return cur;
    }

    /* 获取中序遍历中的下一个结点（仅适用于 root 有左子结点的情况） */
    public TreeNode getInOrderNext(TreeNode root) {
        if (root == null) return root;
        // 循环访问左子结点，直到叶结点时为最小结点，跳出
        while (root.left != null) {
            root = root.left;
        }
        return root;
    }
}

public class binary_search_tree {
    public static void main(String[] args) {
        /* 初始化二叉搜索树 */
        int[] nums = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 };
        BinarySearchTree bst = new BinarySearchTree(nums);
        System.out.println("\n初始化的二叉树为\n");
        PrintUtil.printTree(bst.getRoot());

        /* 查找结点 */
        TreeNode node = bst.search(7);
        System.out.println("\n查找到的结点对象为 " + node + "，结点值 = " + node.val);

        /* 插入结点 */
        node = bst.insert(16);
        System.out.println("\n插入结点 16 后，二叉树为\n");
        PrintUtil.printTree(bst.getRoot());

        /* 删除结点 */
        bst.remove(1);
        System.out.println("\n删除结点 1 后，二叉树为\n");
        PrintUtil.printTree(bst.getRoot());
        bst.remove(2);
        System.out.println("\n删除结点 2 后，二叉树为\n");
        PrintUtil.printTree(bst.getRoot());
        bst.remove(4);
        System.out.println("\n删除结点 4 后，二叉树为\n");
        PrintUtil.printTree(bst.getRoot());
    }
}
