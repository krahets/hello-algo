/**
 * File: binary_tree_bfs.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

using hello_algo.include;
using NUnit.Framework;

namespace hello_algo.chapter_tree
{
    public class binary_tree_bfs
    {

        /* 层序遍历 */
        public List<int> hierOrder(TreeNode root)
        {
            // 初始化队列，加入根结点
            Queue<TreeNode> queue = new();
            queue.Enqueue(root);
            // 初始化一个列表，用于保存遍历序列
            List<int> list = new();
            while (queue.Count != 0)
            {
                TreeNode node = queue.Dequeue(); // 队列出队
                list.Add(node.val);              // 保存结点值
                if (node.left != null)
                    queue.Enqueue(node.left);    // 左子结点入队
                if (node.right != null)
                    queue.Enqueue(node.right);   // 右子结点入队
            }
            return list;
        }

        [Test]
        public void Test()
        {
            /* 初始化二叉树 */
            // 这里借助了一个从数组直接生成二叉树的函数
            TreeNode? root = TreeNode.ArrToTree(new int?[] { 1, 2, 3, 4, 5, 6, 7 });
            Console.WriteLine("\n初始化二叉树\n");
            PrintUtil.PrintTree(root);

            List<int> list = hierOrder(root);
            Console.WriteLine("\n层序遍历的结点打印序列 = " + string.Join(",", list.ToArray()));
        }
    }
}
