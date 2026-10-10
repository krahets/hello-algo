/**
 * File: array_binary_tree.java
 * Created Time: 2023-07-19
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;
import java.util.*;

/* Binary tree class represented by array */
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

    /* Get value of node at index i */
    public Integer val(int i) {
        // If index out of bounds, return null to represent empty position
        if (i < 0 || i >= size())
            return null;
        return tree.get(i);
    }

    /* Get index of left child node of node at index i */
    public Integer left(int i) {
        return 2 * i + 1;
    }

    /* Get index of right child node of node at index i */
    public Integer right(int i) {
        return 2 * i + 2;
    }

    /* Get index of parent node of node at index i */
    public Integer parent(int i) {
        return (i - 1) / 2;
    }

    /* Level-order traversal */
    public List<Integer> levelOrder() {
        List<Integer> res = new ArrayList<>();
        // Traverse array directly
        for (int i = 0; i < size(); i++) {
            if (val(i) != null)
                res.add(val(i));
        }
        return res;
    }

    /* Depth-first traversal */
    private void dfs(Integer i, String order, List<Integer> res) {
        // If empty position, return
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
        // Initialize binary tree
        // Here we use a function to generate a binary tree directly from an array
        List<Integer> arr = Arrays.asList(1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15);

        TreeNode root = TreeNode.listToTree(arr);
        System.out.println("\nInitialize binary tree\n");
        System.out.println("Array representation of binary tree:");
        System.out.println(arr);
        System.out.println("Linked list representation of binary tree:");
        PrintUtil.printTree(root);

        // Binary tree class represented by array
        ArrayBinaryTree abt = new ArrayBinaryTree(arr);

        // Access node
        int i = 1;
        Integer l = abt.left(i);
        Integer r = abt.right(i);
        Integer p = abt.parent(i);
        System.out.println("\nCurrent node index is " + i + ", value is " + abt.val(i));
        System.out.println("Its left child node index is " + l + ", value is " + (l == null ? "null" : abt.val(l)));
        System.out.println("Its right child node index is " + r + ", value is " + (r == null ? "null" : abt.val(r)));
        System.out.println("Its parent node index is " + p + ", value is " + (p == null ? "null" : abt.val(p)));

        // Traverse tree
        List<Integer> res = abt.levelOrder();
        System.out.println("\nLevel-order traversal is:" + res);
        res = abt.preOrder();
        System.out.println("Preorder traversal is:" + res);
        res = abt.inOrder();
        System.out.println("Inorder traversal is:" + res);
        res = abt.postOrder();
        System.out.println("Postorder traversal is:" + res);
    }
}
