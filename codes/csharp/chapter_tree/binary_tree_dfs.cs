/**
 * File: binary_tree_bfs.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

using hello_algo.include;
using NUnit.Framework;

namespace hello_algo.chapter_tree
{
    public class binary_tree_dfs
    {
        List<int> list = new();

        /* 前序遍历 */
        void preOrder(TreeNode? root)
        {
            if (root == null) return;
            // 访问优先级：根结点 -> 左子树 -> 右子树
            list.Add(root.val);
            preOrder(root.left);
            preOrder(root.right);
        }

        /* 中序遍历 */
        void inOrder(TreeNode? root)
        {
            if (root == null) return;
            // 访问优先级：左子树 -> 根结点 -> 右子树
            inOrder(root.left);
            list.Add(root.val);
            inOrder(root.right);
        }

        /* 后序遍历 */
        void postOrder(TreeNode? root)
        {
            if (root == null) return;
            // 访问优先级：左子树 -> 右子树 -> 根结点
            postOrder(root.left);
            postOrder(root.right);
            list.Add(root.val);
        }

        [Test]
        public void Test()
        {
            /* 初始化二叉树 */
            // 这里借助了一个从数组直接生成二叉树的函数
            TreeNode? root = TreeNode.ArrToTree(new int?[] { 1, 2, 3, 4, 5, 6, 7 });
            Console.WriteLine("\n初始化二叉树\n");
            PrintUtil.PrintTree(root);

            list.Clear();
            preOrder(root);
            Console.WriteLine("\n前序遍历的结点打印序列 = " + string.Join(",", list.ToArray()));

            list.Clear();
            inOrder(root);
            Console.WriteLine("\n中序遍历的结点打印序列 = " + string.Join(",", list.ToArray()));

            list.Clear();
            postOrder(root);
            Console.WriteLine("\n后序遍历的结点打印序列 = " + string.Join(",", list.ToArray()));
        }
    }
}
