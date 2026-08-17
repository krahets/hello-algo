/**
* File: build_tree.cs
* Created Time: 2023-07-18
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_divide_and_conquer;

public class build_tree {
    /* Build binary tree: divide and conquer */
    TreeNode? DFS(int[] preorder, Dictionary<int, int> inorderMap, int i, int l, int r) {
        // Terminate when the subtree interval is empty
        if (r - l < 0)
            return null;
        // Initialize the root node
        TreeNode root = new(preorder[i]);
        // Query m to divide the left and right subtrees
        int m = inorderMap[preorder[i]];
        // Subproblem: build the left subtree
        root.left = DFS(preorder, inorderMap, i + 1, l, m - 1);
        // Subproblem: build the right subtree
        root.right = DFS(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // Return the root node
        return root;
    }

    /* Build binary tree */
    TreeNode? BuildTree(int[] preorder, int[] inorder) {
        // Initialize hash map, storing the mapping from inorder elements to indices
        Dictionary<int, int> inorderMap = [];
        for (int i = 0; i < inorder.Length; i++) {
            inorderMap.TryAdd(inorder[i], i);
        }
        TreeNode? root = DFS(preorder, inorderMap, 0, 0, inorder.Length - 1);
        return root;
    }

    [Test]
    public void Test() {
        int[] preorder = [3, 9, 2, 1, 7];
        int[] inorder = [9, 3, 1, 2, 7];
        Console.WriteLine("Preorder traversal = " + string.Join(", ", preorder));
        Console.WriteLine("Inorder traversal = " + string.Join(", ", inorder));

        TreeNode? root = BuildTree(preorder, inorder);
        Console.WriteLine("The constructed binary tree is:");
        PrintUtil.PrintTree(root);
    }
}
