/**
 * File: TreeNode.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.utils;

/* 二叉树节点类 */
public class TreeNode {
    public int val;        // 节点值
    public int height;     // 节点高度
    public TreeNode? left;  // 左子节点引用
    public TreeNode? right; // 右子节点引用

    public TreeNode(int x) {
        val = x;
    }

    /* Generate a binary tree given an array */
    public static TreeNode? ListToTree(List<int?> arr) {
        if (arr.Count == 0 || arr[0] == null)
            return null;

        TreeNode root = new TreeNode(arr[0]!.Value);
        Queue<TreeNode> queue = new Queue<TreeNode>();
        queue.Enqueue(root);
        int i = 0;
        while (queue.Count != 0) {
            TreeNode node = queue.Dequeue();
            if (++i >= arr.Count) break;
            if (arr[i] != null) {
                node.left = new TreeNode((int)arr[i]);
                queue.Enqueue(node.left);
            }
            if (++i >= arr.Count) break;
            if (arr[i] != null) {
                node.right = new TreeNode((int)arr[i]);
                queue.Enqueue(node.right);
            }
        }
        return root;
    }

    /* Serialize a binary tree to a list */
    public static List<int?> TreeToList(TreeNode root) {
        List<int?> list = new();
        if (root == null) return list;
        Queue<TreeNode?> queue = new();
        while (queue.Count != 0) {
            TreeNode? node = queue.Dequeue();
            if (node != null) {
                list.Add(node.val);
                queue.Enqueue(node.left);
                queue.Enqueue(node.right);
            } else {
                list.Add(null);
            }
        }
        return list;
    }

    /* Get a tree node with specific value in a binary tree */
    public static TreeNode? GetTreeNode(TreeNode? root, int val) {
        if (root == null)
            return null;
        if (root.val == val)
            return root;
        TreeNode? left = GetTreeNode(root.left, val);
        TreeNode? right = GetTreeNode(root.right, val);
        return left ?? right;
    }
}
