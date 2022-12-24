/**
 * File: PrintUtil.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.include
{
    public class Trunk
    {
        public Trunk? prev;
        public String str;

        public Trunk(Trunk? prev, String str)
        {
            this.prev = prev;
            this.str = str;
        }
    };

    public class PrintUtil
    {
        /**
         * Print a linked list
         * @param head
         */
        public static void PrintLinkedList(ListNode head)
        {
            List<String> list = new();
            while (head != null)
            {
                list.Add(head.val.ToString());
                head = head.next;
            }
            Console.Write(String.Join(" -> ", list));
        }

        /**
         * The interface of the tree printer
         * This tree printer is borrowed from TECHIE DELIGHT
         * https://www.techiedelight.com/c-program-print-binary-tree/
         * @param root
         */
        public static void PrintTree(TreeNode? root)
        {
            PrintTree(root, null, false);
        }

        /**
         * Print a binary tree
         * @param root
         * @param prev
         * @param isLeft
         */
        public static void PrintTree(TreeNode? root, Trunk? prev, bool isLeft)
        {
            if (root == null)
            {
                return;
            }

            String prev_str = "    ";
            Trunk trunk = new Trunk(prev, prev_str);

            PrintTree(root.right, trunk, true);

            if (prev == null)
            {
                trunk.str = "———";
            }
            else if (isLeft)
            {
                trunk.str = "/———";
                prev_str = "   |";
            }
            else
            {
                trunk.str = "\\———";
                prev.str = prev_str;
            }

            showTrunks(trunk);
            Console.WriteLine(" " + root.val);

            if (prev != null)
            {
                prev.str = prev_str;
            }
            trunk.str = "   |";

            PrintTree(root.left, trunk, false);
        }

        /**
         * Helper function to print branches of the binary tree
         * @param p
         */
        public static void showTrunks(Trunk? p)
        {
            if (p == null)
            {
                return;
            }

            showTrunks(p.prev);
            Console.Write(p.str);
        }

        /**
         * Print a hash map
         * @param <K>
         * @param <V>
         * @param map
         */
        public static void printHashMap<K, V>(Dictionary<K, V> map) where K : notnull
        {
            foreach (var kv in map.Keys)
            {
                Console.WriteLine(kv.ToString() + " -> " + map[kv]?.ToString());
            }
        }
    }

}
