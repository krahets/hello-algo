/**
 * File: binary_tree_bfs.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

public class binary_tree_bfs {

    /* Level-order traversal */
    List<int> LevelOrder(TreeNode root) {
        // Initialize queue, add root node
        Queue<TreeNode> queue = new();
        queue.Enqueue(root);
        // Initialize a list to save the traversal sequence
        List<int> list = [];
        while (queue.Count != 0) {
            TreeNode node = queue.Dequeue(); // Dequeue
            list.Add(node.val!.Value);       // Save node value
            if (node.left != null)
                queue.Enqueue(node.left);    // Left child node enqueue
            if (node.right != null)
                queue.Enqueue(node.right);   // Right child node enqueue
        }
        return list;
    }

    [Test]
    public void Test() {
        /* Initialize binary tree */
        // Here we use a function to generate a binary tree directly from an array
        TreeNode? root = TreeNode.ListToTree([1, 2, 3, 4, 5, 6, 7]);
        Console.WriteLine("\nInitialize binary tree\n");
        PrintUtil.PrintTree(root);

        List<int> list = LevelOrder(root!);
        Console.WriteLine("\nLevel-order traversal node print sequence = " + string.Join(",", list));
    }
}
