/**
 * File: binary_tree_bfs.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

public class binary_tree_bfs {

    /* 层序遍历 */
    List<int> LevelOrder(TreeNode root) {
        // 初始化队列，加入根节点
        Queue<TreeNode> queue = new();
        queue.Enqueue(root);
        // 初始化一个列表，用于保存遍历序列
        List<int> list = [];
        while (queue.Count != 0) {
            TreeNode node = queue.Dequeue(); // 队列出队
            list.Add(node.val!.Value);       // 保存节点值
            if (node.left != null)
                queue.Enqueue(node.left);    // 左子节点入队
            if (node.right != null)
                queue.Enqueue(node.right);   // 右子节点入队
        }
        return list;
    }

    [Test]
    public void Test() {
        /* 初始化二叉树 */
        // 这里借助了一个从数组直接生成二叉树的函数
        TreeNode? root = TreeNode.ListToTree([1, 2, 3, 4, 5, 6, 7]);
        Console.WriteLine("\n初始化二叉树\n");
        PrintUtil.PrintTree(root);

        List<int> list = LevelOrder(root!);
        Console.WriteLine("\n层序遍历的节点打印序列 = " + string.Join(",", list));
    }
}
