using hello_algo.include;
using NUnit.Framework;

namespace hello_algo.chapter_tree
{
    public class binary_tree_bfs
    {

        /// <summary>
        /// 层序遍历
        /// </summary>
        /// <param name="root"></param>
        /// <returns></returns>
        public List<int?> hierOrder(TreeNode root)
        {
            // 初始化队列，加入根结点
            Queue<TreeNode> queue = new();
            queue.Enqueue(root);
            // 初始化一个列表，用于保存遍历序列
            List<int?> list = new();
            while (queue.Count != 0)
            {
                TreeNode node = queue.Dequeue();  // 队列出队
                list.Add(node.val);            // 保存结点值
                if (node.left != null)
                    queue.Enqueue(node.left);    // 左子结点入队
                if (node.right != null)
                    queue.Enqueue(node.right);   // 右子结点入队
            }
            return list;
        }

        List<int?> list = new();

        /// <summary>
        /// 前序遍历
        /// </summary>
        /// <param name="root"></param>
        void preOrder(TreeNode? root)
        {
            if (root == null) return;
            // 访问优先级：根结点 -> 左子树 -> 右子树
            list.Add(root.val);
            preOrder(root.left);
            preOrder(root.right);
        }

        /// <summary>
        /// 中序遍历
        /// </summary>
        /// <param name="root"></param>
        void inOrder(TreeNode? root)
        {
            if (root == null) return;
            // 访问优先级：左子树 -> 根结点 -> 右子树
            inOrder(root.left);
            list.Add(root.val);
            inOrder(root.right);
        }

        /// <summary>
        /// 后序遍历
        /// </summary>
        /// <param name="root"></param>
        void postOrder(TreeNode? root)
        {
            if (root == null) return;
            // 访问优先级：左子树 -> 右子树 -> 根结点
            postOrder(root.left);
            postOrder(root.right);
            list.Add(root.val);
        }

        /// <summary>
        /// 辅助函数,数组转字符串
        /// </summary>
        public static string ToString(int?[] nums)
        {
            return string.Join(",", nums);
        }

        [Test]
        public void Test()
        {
            // 初始化结点
            TreeNode root = new TreeNode(1);
            TreeNode n2 = new TreeNode(2);
            TreeNode n3 = new TreeNode(3);
            TreeNode n4 = new TreeNode(4);
            TreeNode n5 = new TreeNode(5);
            TreeNode n6 = new TreeNode(6);
            TreeNode n7 = new TreeNode(7);
            // 构建引用指向（即指针）
            root.left = n2;
            root.right = n3;
            n2.left = n4;
            n2.right = n5;
            n3.left = n6;
            n3.right = n7;

            list = hierOrder(root);
            Console.WriteLine("层序遍历 结果 = " + ToString(list.ToArray()));

            list = new List<int?>();
            preOrder(root);
            Console.WriteLine("前序遍历 结果 = " + ToString(list.ToArray()));

            list = new List<int?>();
            inOrder(root);
            Console.WriteLine("中序遍历 结果 = " + ToString(list.ToArray()));

            list = new List<int?>();
            postOrder(root);
            Console.WriteLine("后序遍历 结果 = " + ToString(list.ToArray()));
        }
    }
}
