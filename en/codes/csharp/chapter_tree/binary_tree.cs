/**
 * File: binary_tree.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

public class binary_tree {
    [Test]
    public void Test() {
        /* Initialize binary tree */
        // Initialize nodes
        TreeNode n1 = new(1);
        TreeNode n2 = new(2);
        TreeNode n3 = new(3);
        TreeNode n4 = new(4);
        TreeNode n5 = new(5);
        // Build references (pointers) between nodes
        n1.left = n2;
        n1.right = n3;
        n2.left = n4;
        n2.right = n5;
        Console.WriteLine("\nInitialize binary tree\n");
        PrintUtil.PrintTree(n1);

        /* Insert node P between n1 -> n2 */
        TreeNode P = new(0);
        // Delete node
        n1.left = P;
        P.left = n2;
        Console.WriteLine("\nAfter inserting node P\n");
        PrintUtil.PrintTree(n1);
        // Remove node P
        n1.left = n2;
        Console.WriteLine("\nAfter removing node P\n");
        PrintUtil.PrintTree(n1);
    }
}
