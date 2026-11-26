/**
* File: PrintUtil.cs
* Created Time: 2022-12-23
* Author: haptear (haptear@hotmail.com), krahets (krahets@163.com)
*/

namespace hello_algo.utils;

public class Trunk(Trunk? prev, string str) {
    public Trunk? prev = prev;
    public string str = str;
};

public static class PrintUtil {
    /* 印出串列 */
    public static void PrintList<T>(IList<T> list) {
        Console.WriteLine("[" + string.Join(", ", list) + "]");
    }

    public static string PrintList<T>(this IEnumerable<T?> list) {
        return $"[ {string.Join(", ", list.Select(x => x?.ToString() ?? "null"))} ]";
    }

    /* 印出矩陣（Array） */
    public static void PrintMatrix<T>(T[][] matrix) {
        Console.WriteLine("[");
        foreach (T[] row in matrix) {
            Console.WriteLine("  " + string.Join(", ", row) + ",");
        }
        Console.WriteLine("]");
    }

    /* 印出矩陣（List） */
    public static void PrintMatrix<T>(List<List<T>> matrix) {
        Console.WriteLine("[");
        foreach (List<T> row in matrix) {
            Console.WriteLine("  " + string.Join(", ", row) + ",");
        }
        Console.WriteLine("]");
    }

    /* 印出鏈結串列 */
    public static void PrintLinkedList(ListNode? head) {
        List<string> list = [];
        while (head != null) {
            list.Add(head.val.ToString());
            head = head.next;
        }
        Console.Write(string.Join(" -> ", list));
    }

    /**
     * 印出二元樹
     * 這段印出樹狀結構的程式碼取自 TECHIE DELIGHT
     * https://www.techiedelight.com/c-program-print-binary-tree/
     */
    public static void PrintTree(TreeNode? root) {
        PrintTree(root, null, false);
    }

    /* 印出二元樹 */
    public static void PrintTree(TreeNode? root, Trunk? prev, bool isRight) {
        if (root == null) {
            return;
        }

        string prev_str = "    ";
        Trunk trunk = new(prev, prev_str);

        PrintTree(root.right, trunk, true);

        if (prev == null) {
            trunk.str = "———";
        } else if (isRight) {
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

    public static void ShowTrunks(Trunk? p) {
        if (p == null) {
            return;
        }

        ShowTrunks(p.prev);
        Console.Write(p.str);
    }

    /* 印出雜湊表 */
    public static void PrintHashMap<K, V>(Dictionary<K, V> map) where K : notnull {
        foreach (var kv in map.Keys) {
            Console.WriteLine(kv.ToString() + " -> " + map[kv]?.ToString());
        }
    }

    /* 印出堆積 */
    public static void PrintHeap(Queue<int> queue) {
        Console.Write("堆積的陣列表示法：");
        List<int> list = [.. queue];
        Console.WriteLine(string.Join(',', list));
        Console.WriteLine("堆積的樹狀表示法：");
        TreeNode? tree = TreeNode.ListToTree(list.Cast<int?>().ToList());
        PrintTree(tree);
    }

    /* 印出優先佇列 */
    public static void PrintHeap(PriorityQueue<int, int> queue) {
        var newQueue = new PriorityQueue<int, int>(queue.UnorderedItems, queue.Comparer);
        Console.Write("堆積的陣列表示法：");
        List<int> list = [];
        while (newQueue.TryDequeue(out int element, out _)) {
            list.Add(element);
        }
        Console.WriteLine(string.Join(',', list.ToList()));
        Console.WriteLine("堆積的樹狀表示法：");
        TreeNode? tree = TreeNode.ListToTree(list.Cast<int?>().ToList());
        PrintTree(tree);
    }
}