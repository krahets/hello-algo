// File: ListNode.cs
// Created Time: 2022-12-16
// Author: mingXta (1195669834@qq.com)

namespace hello_algo.include
{
    public class TreeNode
    {
        public int? val;        // 结点值
        public int height;      // 结点高度
        public TreeNode? left;  // 左子结点引用
        public TreeNode? right; // 右子结点引用

        public TreeNode(int? x)
        {
            val = x;
        }

        /**
         * Generate a binary tree with an array
         * @param arr
         * @return
         */
        public static TreeNode? arrToTree(int?[] arr)
        {
            if (arr.Length == 0)
                return null;

            TreeNode root = new TreeNode(arr[0]);
            Queue<TreeNode> queue = new Queue<TreeNode>();
            queue.Enqueue(root);
            int i = 1;
            while (queue.Count!=0)
            {
                TreeNode node = queue.Dequeue();
                if (arr[i] != null)
                {
                    node.left = new TreeNode(arr[i]);
                    queue.Enqueue(node.left);
                }
                i++;
                if (arr[i] != null)
                {
                    node.right = new TreeNode(arr[i]);
                    queue.Enqueue(node.right);
                }
                i++;
            }
            return root;
        }

        /**
         * Serialize a binary tree to a list
         * @param root
         * @return
         */
        public static List<int?> treeToList(TreeNode root)
        {
            List<int?> list = new();
            if (root == null) return list;
            Queue<TreeNode?> queue = new();
            while (queue.Count != 0)
            {
                TreeNode? node = queue.Dequeue();
                if (node != null)
                {
                    list.Add(node.val);
                    queue.Enqueue(node.left);
                    queue.Enqueue(node.right);
                }
                else
                {
                    list.Add(null);
                }
            }
            return list;
        }

        /**
         * Get a tree node with specific value in a binary tree
         * @param root
         * @param val
         * @return
         */
        public static TreeNode? getTreeNode(TreeNode? root, int val)
        {
            if (root == null)
                return null;
            if (root.val == val)
                return root;
            TreeNode? left = getTreeNode(root.left, val);
            TreeNode? right = getTreeNode(root.right, val);
            return left != null ? left : right;
        }
    }
}
