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
        // Visit priority: root node -> left subtree -> right subtree
        list.Add(root.val!.Value);
        PreOrder(root.left);
        PreOrder(root.right);
    }

    /* Inorder traversal */
    void InOrder(TreeNode? root) {
        if (root == null) return;
        // Visit priority: left subtree -> root node -> right subtree
        InOrder(root.left);
        list.Add(root.val!.Value);
        InOrder(root.right);
    }

    /* Postorder traversal */
    void PostOrder(TreeNode? root) {
        if (root == null) return;
        // Visit priority: left subtree -> right subtree -> root node
        PostOrder(root.left);
        PostOrder(root.right);
        list.Add(root.val!.Value);
    }

    [Test]
    public void Test() {
        /* Initialize binary tree */
        // Here we use a function to generate a binary tree directly from an array
        TreeNode? root = TreeNode.ListToTree([1, 2, 3, 4, 5, 6, 7]);
        Console.WriteLine("\nInitialize binary tree\n");
        PrintUtil.PrintTree(root);

        list.Clear();
        PreOrder(root);
        Console.WriteLine("\nPreorder traversal node print sequence = " + string.Join(",", list));

        list.Clear();
        InOrder(root);
        Console.WriteLine("\nInorder traversal node print sequence = " + string.Join(",", list));

        list.Clear();
        PostOrder(root);
        Console.WriteLine("\nPostorder traversal node print sequence = " + string.Join(",", list));
    }
}
