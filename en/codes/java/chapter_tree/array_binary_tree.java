/**
 * File: array_binary_tree.java
 * Created Time: 2023-07-19
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;
import java.util.*;

/* Binary tree class using an array representation */
class ArrayBinaryTree {
    private List<Integer> tree;

    /* Constructor */
    public ArrayBinaryTree(List<Integer> arr) {
        tree = new ArrayList<>(arr);
    }

    /* List size */
    public int size() {
        return tree.size();
    }

    /* Get the value of the node at index i */
    public Integer val(int i) {
        // If the index is out of bounds, return null to represent an empty position
        if (i < 0 || i >= size())
            return null;
        return tree.get(i);
    }

    /* Get the left child index of the node at index i */
    public Integer left(int i) {
        return 2 * i + 1;
    }

    /* Get the right child index of the node at index i */
    public Integer right(int i) {
        return 2 * i + 2;
    }

    /* Get the parent index of the node at index i */
    public Integer parent(int i) {
        return (i - 1) / 2;
    }

    /* Level-order traversal */
    public List<Integer> levelOrder() {
        List<Integer> res = new ArrayList<>();
        // Traverse the array directly
        for (int i = 0; i < size(); i++) {
            if (val(i) != null)
                res.add(val(i));
        }
        return res;
    }

    /* Depth-first traversal */
    private void dfs(Integer i, String order, List<Integer> res) {
        // Return if this position is empty
        if (val(i) == null)
            return;
        // Preorder traversal
        if ("pre".equals(order))
            res.add(val(i));
        dfs(left(i), order, res);
        // Inorder traversal
        if ("in".equals(order))
            res.add(val(i));
        dfs(right(i), order, res);
        // Postorder traversal
        if ("post".equals(order))
            res.add(val(i));
    }

    /* Preorder traversal */
    public List<Integer> preOrder() {
        List<Integer> res = new ArrayList<>();
        dfs(0, "pre", res);
        return res;
    }

    /* Inorder traversal */
    public List<Integer> inOrder() {
        List<Integer> res = new ArrayList<>();
        dfs(0, "in", res);
        return res;
    }

    /* Postorder traversal */
    public List<Integer> postOrder() {
        List<Integer> res = new ArrayList<>();
        dfs(0, "post", res);
        return res;
    }
}

public class array_binary_tree {
    public static void main(String[] args) {
        // Initialize the binary tree
        // Use a helper function that builds a binary tree directly from an array
        List<Integer> arr = Arrays.asList(1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15);

        TreeNode root = TreeNode.listToTree(arr);
        System.out.println("\nInitialize the binary tree\n");
        System.out.println("Array representation of the binary tree:");
        System.out.println(arr);
        System.out.println("Linked representation of the binary tree:");
        PrintUtil.printTree(root);

        // Binary tree class using an array representation
        ArrayBinaryTree abt = new ArrayBinaryTree(arr);

        // Access a node
        int i = 1;
        Integer l = abt.left(i);
        Integer r = abt.right(i);
        Integer p = abt.parent(i);
        System.out.println("\nCurrent node index: " + i + " with value " + abt.val(i));
        System.out.println("Left child index: " + l + " with value " + (l == null ? "null" : abt.val(l)));
        System.out.println("Right child index: " + r + " with value " + (r == null ? "null" : abt.val(r)));
        System.out.println("Parent index: " + p + " with value " + (p == null ? "null" : abt.val(p)));

        // Traverse the tree
        List<Integer> res = abt.levelOrder();
        System.out.println("\nLevel-order traversal:" + res);
        res = abt.preOrder();
        System.out.println("Preorder traversal:" + res);
        res = abt.inOrder();
        System.out.println("Inorder traversal:" + res);
        res = abt.postOrder();
        System.out.println("Postorder traversal:" + res);
    }
}
