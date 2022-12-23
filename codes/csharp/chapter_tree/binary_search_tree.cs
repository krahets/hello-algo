/**
 * File: binary_search_tree.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

using hello_algo.include;
using NUnit.Framework;

namespace hello_algo.chapter_tree
{
    internal class binary_search_tree
    {
        TreeNode? root;

        /// <summary>
        /// 查找结点
        /// </summary>
        /// <param name="num"></param>
        /// <returns></returns>
        TreeNode? search(int num)
        {
            TreeNode? cur = root;
            // 循环查找，越过叶结点后跳出
            while (cur != null)
            {
                // 目标结点在 root 的右子树中
                if (cur.val < num) cur = cur.right;
                // 目标结点在 root 的左子树中
                else if (cur.val > num) cur = cur.left;
                // 找到目标结点，跳出循环
                else break;
            }
            // 返回目标结点
            return cur;
        }

        /* 插入结点 */
        TreeNode? insert(int num)
        {
            // 若树为空，直接提前返回
            if (root == null) return null;
            TreeNode? cur = root, pre = null;
            // 循环查找，越过叶结点后跳出
            while (cur != null)
            {
                // 找到重复结点，直接返回
                if (cur.val == num) return null;
                pre = cur;
                // 插入位置在 root 的右子树中
                if (cur.val < num) cur = cur.right;
                // 插入位置在 root 的左子树中
                else cur = cur.left;
            }

            // 插入结点 val
            TreeNode node = new TreeNode(num);
            if (pre != null)
            {
                if (pre.val < num) pre.right = node;
                else pre.left = node;
            }
            return node;
        }


        /* 删除结点 */
        TreeNode? remove(int? num)
        {
            // 若树为空，直接提前返回
            if (root == null) return null;
            TreeNode? cur = root, pre = null;
            // 循环查找，越过叶结点后跳出
            while (cur != null)
            {
                // 找到待删除结点，跳出循环
                if (cur.val == num) break;
                pre = cur;
                // 待删除结点在 root 的右子树中
                if (cur.val < num) cur = cur.right;
                // 待删除结点在 root 的左子树中
                else cur = cur.left;
            }
            // 若无待删除结点，则直接返回
            if (cur == null || pre == null) return null;
            // 子结点数量 = 0 or 1
            if (cur.left == null || cur.right == null)
            {
                // 当子结点数量 = 0 / 1 时， child = null / 该子结点
                TreeNode? child = cur.left != null ? cur.left : cur.right;
                // 删除结点 cur
                if (pre.left == cur)
                {
                    pre.left = child;
                }
                else
                {
                    pre.right = child;
                }

            }
            // 子结点数量 = 2
            else
            {
                // 获取中序遍历中 cur 的下一个结点
                TreeNode? nex = min(cur.right);
                if (nex != null)
                {
                    int? tmp = nex.val;
                    // 递归删除结点 nex
                    remove(nex.val);
                    // 将 nex 的值复制给 cur
                    cur.val = tmp;
                }
            }
            return cur;
        }

        /* 获取最小结点 */
        TreeNode? min(TreeNode? root)
        {
            if (root == null) return root;
            // 循环访问左子结点，直到叶结点时为最小结点，跳出
            while (root.left != null)
            {
                root = root.left;
            }
            return root;
        }

        [Test]
        public void Test()
        {
            // 初始化结点
            TreeNode n1 = new TreeNode(1);
            TreeNode n2 = new TreeNode(2);
            TreeNode n3 = new TreeNode(3);
            TreeNode n4 = new TreeNode(4);
            TreeNode n5 = new TreeNode(5);
            TreeNode n6 = new TreeNode(6);
            TreeNode n7 = new TreeNode(7);
            TreeNode n8 = new TreeNode(8);
            TreeNode n9 = new TreeNode(9);
            TreeNode n10 = new TreeNode(10);
            TreeNode n11 = new TreeNode(11);
            TreeNode n12 = new TreeNode(12);
            TreeNode n13 = new TreeNode(13);
            TreeNode n14 = new TreeNode(14);
            TreeNode n15 = new TreeNode(15);
            root = n8;
            root.left = n4;
            root.right = n12;
            n4.left = n2;
            n4.right = n6;
            n12.left = n10;
            n12.right = n14;
            n2.left = n1;
            n2.right = n3;
            n6.left = n5;
            n6.right = n7;
            n10.left = n9;
            n10.right = n11;
            n14.left = n13;
            n14.right = n15;

            var cur = search(7);
            Console.WriteLine("查找结点 结果 = " + cur?.val);

            var node = insert(16);
            Console.WriteLine("插入结点 结果 = " + node?.val);

            node = remove(1);
            Console.WriteLine("删除结点 结果 = " + node?.val);
            node = remove(2);
            Console.WriteLine("删除结点 结果 = " + node?.val);
            node = remove(4);
            Console.WriteLine("删除结点 结果 = " + node?.val);

        }
    }
}
