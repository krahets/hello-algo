package include;

import java.util.*;

/**
 * Definition for a binary tree node.
 */
public class TreeNode {
    public int val;
    public TreeNode left;
    public TreeNode right;

    public TreeNode(int x) {
        val = x;
    }

    /**
     * Generate a binary tree with an array
     * @param arr
     * @return
     */
    public static TreeNode arrToTree(Integer[] arr) {
        TreeNode root = new TreeNode(arr[0]);
        Queue<TreeNode> queue = new LinkedList<>() {{ add(root); }};
        int i = 1;
        while(!queue.isEmpty()) {
            TreeNode node = queue.poll();
            if(arr[i] != null) {
                node.left = new TreeNode(arr[i]);
                queue.add(node.left);
            }
            i++;
            if(arr[i] != null) {
                node.right = new TreeNode(arr[i]);
                queue.add(node.right);
            }
            i++;
        }
        return root;
    }

    /**
     * Serialize a binary tree to a list
     * @param root
     * @return
     */
    public static List<Integer> treeToList(TreeNode root) {
        List<Integer> list = new ArrayList<>();
        if(root == null) return list;
        Queue<TreeNode> queue = new LinkedList<>() {{ add(root); }};
        while(!queue.isEmpty()) {
            TreeNode node = queue.poll();
            if(node != null) {
                list.add(node.val);
                queue.add(node.left);
                queue.add(node.right);
            }
            else {
                list.add(null);
            }
        }
        return list;
    }
    
    /**
     * Get a tree node with specific value in a binary tree
     * @param root
     * @param val
     * @return
     */
    public static TreeNode getTreeNode(TreeNode root, int val) {
        if (root == null)
            return null;
        if (root.val == val)
            return root;
        TreeNode left = getTreeNode(root.left, val);
        TreeNode right = getTreeNode(root.right, val);
        return left != null ? left : right;
    }
}
