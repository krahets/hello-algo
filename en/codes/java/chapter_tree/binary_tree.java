/**
 * File: binary_tree.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;

public class binary_tree {
    public static void main(String[] args) {
        /* Initialize binary tree */
        // Initialize node
        TreeNode n1 = new TreeNode(1);
        TreeNode n2 = new TreeNode(2);
        TreeNode n3 = new TreeNode(3);
        TreeNode n4 = new TreeNode(4);
        TreeNode n5 = new TreeNode(5);
        // Construct node references (pointers)
        n1.left = n2;
        n1.right = n3;
        n2.left = n4;
        n2.right = n5;
        System.out.println("\nInitialize binary tree\n");
        PrintUtil.printTree(n1);

        /* Insert and remove nodes */
        TreeNode P = new TreeNode(0);
        // Insert node P between n1 -> n2
        n1.left = P;
        P.left = n2;
        System.out.println("\nAfter inserting node P\n");
        PrintUtil.printTree(n1);
        // Remove node P
        n1.left = n2;
        System.out.println("\nAfter removing node P\n");
        PrintUtil.printTree(n1);
    }
}
