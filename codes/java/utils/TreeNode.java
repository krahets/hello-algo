/**
 * File: TreeNode.java
 * Created Time: 2022-11-25
 * Author: Krahets (krahets@163.com)
 */

package utils;

import java.util.*;

/* Definition for a binary tree node. */
public class TreeNode {
    public int val; // 节点值
    public int height; // 节点高度
    public TreeNode left; // 左子节点引用
    public TreeNode right; // 右子节点引用

    public TreeNode(int x) {
        val = x;
    }

    /* Generate a binary tree given an array */
    public static TreeNode listToTree(List<Integer> list) {
        int size = list.size();
        if (size == 0)
            return null;

        TreeNode root = new TreeNode(list.get(0));
        Queue<TreeNode> queue = new LinkedList<>() {{ add(root); }};
        int i = 0;
        while (!queue.isEmpty()) {
            TreeNode node = queue.poll();
            if (++i >= size)
                break;
            if (list.get(i) != null) {
                node.left = new TreeNode(list.get(i));
                queue.add(node.left);
            }
            if (++i >= size)
                break;
            if (list.get(i) != null) {
                node.right = new TreeNode(list.get(i));
                queue.add(node.right);
            }
        }
        return root;
    }

    /* Serialize a binary tree to a list */
    public static List<Integer> treeToList(TreeNode root) {
        List<Integer> list = new ArrayList<>();
        if (root == null)
            return list;
        Queue<TreeNode> queue = new LinkedList<>() {{ add(root); }};
        while (!queue.isEmpty()) {
            TreeNode node = queue.poll();
            if (node != null) {
                list.add(node.val);
                queue.add(node.left);
                queue.add(node.right);
            } else {
                list.add(null);
            }
        }
        return list;
    }
}
