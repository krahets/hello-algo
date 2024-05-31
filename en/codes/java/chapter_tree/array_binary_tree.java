/**
 * File: array_binary_tree.java
 * Created Time: 2023-07-19
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;
import java.util.*;

/* Array-based binary tree class */
class ArrayBinaryTree {
    private List<Integer> tree;

    /* Constructor */
    public ArrayBinaryTree(List<Integer> arr) {
        tree = new ArrayList<>(arr);
    }

    /* List capacity */
    public int size() {
        return tree.size();
    }

    /* Get the value of the node at index i */
    public Integer val(int i) {
        // If the index is out of bounds, return null, representing an empty spot
        if (i < 0 || i >= size())
            return null;
        return tree.get(i);
    }

    /* Get the index of the left child of the node at index i */
    public Integer left(int i) {
        return 2 * i + 1;
    }

    /* Get the index of the right child of the node at index i */
    public Integer right(int i) {
        return 2 * i + 2;
    }

    /* Get the index of the parent of the node at index i */
    public Integer parent(int i) {
        return (i - 1) / 2;
    }

    /* Level-order traversal */
    public List<Integer> levelOrder() {
        List<Integer> res = new ArrayList<>();
        // Traverse array
        for (int i = 0; i < size(); i++) {
            if (val(i) != null)
                res.add(val(i));
        }
        return res;
    }

    /* Depth-first traversal */
    private void dfs(Integer i, String order, List<Integer> res) {
        // If it is an empty spot, return
        if (val(i) == null)
            return;
        // Pre-order traversal
        if ("pre".equals(order))
            res.add(val(i));
        dfs(left(i), order, res);
        // In-order traversal
        if ("in".equals(order))
            res.add(val(i));
        dfs(right(i), order, res);
        // Post-order traversal
        if ("post".equals(order))
            res.add(val(i));
    }

    /* Pre-order traversal */
    public List<Integer> preOrder() {
        List<Integer> res = new ArrayList<>();
        dfs(0, "pre", res);
        return res;
    }

    /* In-order traversal */
    public List<Integer> inOrder() {
        List<Integer> res = new ArrayList<>();
        dfs(0, "in", res);
        return res;
    }

    /* Post-order traversal */
    public List<Integer> postOrder() {
        List<Integer> res = new ArrayList<>();
        dfs(0, "post", res);
        return res;
    }
}

public class array_binary_tree {
    public static void main(String[] args) {
        // Initialize binary tree
        // Use a specific function to convert an array into a binary tree
        List<Integer> arr = Arrays.asList(1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15);

        TreeNode root = TreeNode.listToTree(arr);
        System.out.println("\nInitialize binary tree\n");
        System.out.println("Array representation of the binary tree:");
        System.out.println(arr);
        System.out.println("Linked list representation of the binary tree:");
        PrintUtil.printTree(root);

        // Array-based binary tree class
        ArrayBinaryTree abt = new ArrayBinaryTree(arr);

        // Access node
        int i = 1;
        Integer l = abt.left(i);
        Integer r = abt.right(i);
        Integer p = abt.parent(i);
        System.out.println("\nThe current node's index is " + i + ", value = " + abt.val(i));
        System.out.println("Its left child's index is " + l + ", value = " + (l == null ? "null" : abt.val(l)));
        System.out.println("Its right child's index is " + r + ", value = " + (r == null ? "null" : abt.val(r)));
        System.out.println("Its parent's index is " + p + ", value = " + (p == null ? "null" : abt.val(p)));

        // Traverse tree
        List<Integer> res = abt.levelOrder();
        System.out.println("\nLevel-order traversal is:" + res);
        res = abt.preOrder();
        System.out.println("Pre-order traversal is:" + res);
        res = abt.inOrder();
        System.out.println("In-order traversal is:" + res);
        res = abt.postOrder();
        System.out.println("Post-order traversal is:" + res);
    }
}
