/**
* File: PrintUtil.cs
* Created Time: 2022-12-23
* Author: haptear (haptear@hotmail.com), krahets (krahets@163.com)
*/

namespace hello_algo.utils;

public class Trunk {
    public Trunk? prev;
    public string str;

    public Trunk(Trunk? prev, string str) {
        this.prev = prev;
        this.str = str;
    }
};

public static class PrintUtil {
    /* Print a list */
    public static void PrintList<T>(IList<T> list) {
        Console.WriteLine("[" + string.Join(", ", list) + "]");
    }

    public static string PrintList<T>(this IEnumerable<T?> list) {
        return $"[ {string.Join(", ", list.Select(x => x?.ToString() ?? "null"))} ]";
    }

    /* Print a matrix (Array) */
    public static void PrintMatrix<T>(T[][] matrix) {
        Console.WriteLine("[");
        foreach (T[] row in matrix) {
            Console.WriteLine("  " + string.Join(", ", row) + ",");
        }
        Console.WriteLine("]");
    }

    /* Print a matrix (List) */
    public static void PrintMatrix<T>(List<List<T>> matrix) {
        Console.WriteLine("[");
        foreach (List<T> row in matrix) {
            Console.WriteLine("  " + string.Join(", ", row) + ",");
        }
        Console.WriteLine("]");
    }

    /* Print a linked list */
    public static void PrintLinkedList(ListNode head) {
        List<string> list = new();
        while (head != null) {
            list.Add(head.val.ToString());
            head = head.next;
        }
        Console.Write(string.Join(" -> ", list));
    }

    /**
     * The interface of the tree printer
     * This tree printer is borrowed from TECHIE DELIGHT
     * https://www.techiedelight.com/c-program-print-binary-tree/
     */
    public static void PrintTree(TreeNode? root) {
        PrintTree(root, null, false);
    }

    /* Print a binary tree */
    public static void PrintTree(TreeNode? root, Trunk? prev, bool isLeft) {
        if (root == null) {
            return;
        }

        string prev_str = "    ";
        Trunk trunk = new Trunk(prev, prev_str);

        PrintTree(root.right, trunk, true);

        if (prev == null) {
            trunk.str = "———";
        } else if (isLeft) {
            trunk.str = "/———";
            prev_str = "   |";
        } else {
            trunk.str = "\\———";
            prev.str = prev_str;
        }

        ShowTrunks(trunk);
        Console.WriteLine(" " + root.val);

        if (prev != null) {
            prev.str = prev_str;
        }
        trunk.str = "   |";

        PrintTree(root.left, trunk, false);
    }

    /* Helper function to print branches of the binary tree */
    public static void ShowTrunks(Trunk? p) {
        if (p == null) {
            return;
        }

        ShowTrunks(p.prev);
        Console.Write(p.str);
    }

    /* Print a hash map */
    public static void PrintHashMap<K, V>(Dictionary<K, V> map) where K : notnull {
        foreach (var kv in map.Keys) {
            Console.WriteLine(kv.ToString() + " -> " + map[kv]?.ToString());
        }
    }

    /* Print a heap */
    public static void PrintHeap(Queue<int> queue) {
        Console.Write("堆的数组表示：");
        List<int> list = queue.ToList();
        Console.WriteLine(string.Join(',', list));
        Console.WriteLine("堆的树状表示：");
        TreeNode tree = TreeNode.ListToTree(list.Cast<int?>().ToList());
        PrintTree(tree);
    }

    /* Print a PriorityQueue */
    public static void PrintHeap(PriorityQueue<int, int> queue) {
        var newQueue = new PriorityQueue<int, int>(queue.UnorderedItems, queue.Comparer);
        Console.Write("堆的数组表示：");
        List<int> list = new List<int>();
        while (newQueue.TryDequeue(out int element, out int priority)) {
            list.Add(element);
        }
        Console.WriteLine("堆的树状表示：");
        Console.WriteLine(string.Join(',', list.ToList()));
        TreeNode tree = TreeNode.ListToTree(list.Cast<int?>().ToList());
        PrintTree(tree);
    }
}