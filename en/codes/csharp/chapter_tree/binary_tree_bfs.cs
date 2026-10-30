/**
 * File: binary_tree_bfs.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

public class binary_tree_bfs {

    /* Level-order traversal */
    List<int> LevelOrder(TreeNode root) {
        // Initialize a queue and enqueue the root
        Queue<TreeNode> queue = new();
        queue.Enqueue(root);
        // Initialize a list to store the traversal sequence
        List<int> list = [];
        while (queue.Count != 0) {
            TreeNode node = queue.Dequeue(); // Dequeue from the queue
            list.Add(node.val!.Value);       // Store the node value
            if (node.left != null)
                queue.Enqueue(node.left);    // Enqueue the left child
            if (node.right != null)
                queue.Enqueue(node.right);   // Enqueue the right child
        }
        return list;
    }

    [Test]
    public void Test() {
        /* Initialize the binary tree */
        // Use a helper function that builds a binary tree directly from an array
        TreeNode? root = TreeNode.ListToTree([1, 2, 3, 4, 5, 6, 7]);
        Console.WriteLine("\nInitialize the binary tree\n");
        PrintUtil.PrintTree(root);

        List<int> list = LevelOrder(root!);
        Console.WriteLine("\nNode sequence from level-order traversal = " + string.Join(",", list));
    }
}
