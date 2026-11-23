/**
 * File: binary_tree_dfs.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

public class binary_tree_dfs {
    List<int> list = [];

    /* Preorder traversal */
    void PreOrder(TreeNode? root) {
        if (root == null) return;
        // Visit order: root -> left subtree -> right subtree
        list.Add(root.val!.Value);
        PreOrder(root.left);
        PreOrder(root.right);
    }

    /* Inorder traversal */
    void InOrder(TreeNode? root) {
        if (root == null) return;
        // Visit order: left subtree -> root -> right subtree
        InOrder(root.left);
        list.Add(root.val!.Value);
        InOrder(root.right);
    }

    /* Postorder traversal */
    void PostOrder(TreeNode? root) {
        if (root == null) return;
        // Visit order: left subtree -> right subtree -> root
        PostOrder(root.left);
        PostOrder(root.right);
        list.Add(root.val!.Value);
    }

    [Test]
    public void Test() {
        /* Initialize the binary tree */
        // Use a helper function that builds a binary tree directly from an array
        TreeNode? root = TreeNode.ListToTree([1, 2, 3, 4, 5, 6, 7]);
        Console.WriteLine("\nInitialize the binary tree\n");
        PrintUtil.PrintTree(root);

        list.Clear();
        PreOrder(root);
        Console.WriteLine("\nNode sequence from preorder traversal = " + string.Join(",", list));

        list.Clear();
        InOrder(root);
        Console.WriteLine("\nNode sequence from inorder traversal = " + string.Join(",", list));

        list.Clear();
        PostOrder(root);
        Console.WriteLine("\nNode sequence from postorder traversal = " + string.Join(",", list));
    }
}
