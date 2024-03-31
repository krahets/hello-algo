/**
 * File: PrintUtil.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package utils;

import java.util.*;

class Trunk {
    Trunk prev;
    String str;

    Trunk(Trunk prev, String str) {
        this.prev = prev;
        this.str = str;
    }
};

public class PrintUtil {
    /* 列印矩陣（Array） */
    public static <T> void printMatrix(T[][] matrix) {
        System.out.println("[");
        for (T[] row : matrix) {
            System.out.println("  " + row + ",");
        }
        System.out.println("]");
    }

    /* 列印矩陣（List） */
    public static <T> void printMatrix(List<List<T>> matrix) {
        System.out.println("[");
        for (List<T> row : matrix) {
            System.out.println("  " + row + ",");
        }
        System.out.println("]");
    }

    /* 列印鏈結串列 */
    public static void printLinkedList(ListNode head) {
        List<String> list = new ArrayList<>();
        while (head != null) {
            list.add(String.valueOf(head.val));
            head = head.next;
        }
        System.out.println(String.join(" -> ", list));
    }

    /* 列印二元樹 */
    public static void printTree(TreeNode root) {
        printTree(root, null, false);
    }

    /**
     * 列印二元樹
     * This tree printer is borrowed from TECHIE DELIGHT
     * https://www.techiedelight.com/c-program-print-binary-tree/
     */
    public static void printTree(TreeNode root, Trunk prev, boolean isRight) {
        if (root == null) {
            return;
        }

        String prev_str = "    ";
        Trunk trunk = new Trunk(prev, prev_str);

        printTree(root.right, trunk, true);

        if (prev == null) {
            trunk.str = "———";
        } else if (isRight) {
            trunk.str = "/———";
            prev_str = "   |";
        } else {
            trunk.str = "\\———";
            prev.str = prev_str;
        }

        showTrunks(trunk);
        System.out.println(" " + root.val);

        if (prev != null) {
            prev.str = prev_str;
        }
        trunk.str = "   |";

        printTree(root.left, trunk, false);
    }

    public static void showTrunks(Trunk p) {
        if (p == null) {
            return;
        }

        showTrunks(p.prev);
        System.out.print(p.str);
    }

    /* 列印雜湊表 */
    public static <K, V> void printHashMap(Map<K, V> map) {
        for (Map.Entry<K, V> kv : map.entrySet()) {
            System.out.println(kv.getKey() + " -> " + kv.getValue());
        }
    }

    /* 列印堆積（優先佇列） */
    public static void printHeap(Queue<Integer> queue) {
        List<Integer> list = new ArrayList<>(queue);
        System.out.print("堆積的陣列表示：");
        System.out.println(list);
        System.out.println("堆積的樹狀表示：");
        TreeNode root = TreeNode.listToTree(list);
        printTree(root);
    }
}
