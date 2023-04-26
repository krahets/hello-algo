/**
 * File: PrintUtil.java
 * Created Time: 2022-11-25
 * Author: Krahets (krahets@163.com)
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

    /* Print a matrix (Array) */
    public static <T> void printMatrix(T[][] matrix) {
        System.out.println("[");
        for (T[] row : matrix) {
            System.out.println("  " + row + ",");
        }
        System.out.println("]");
    }

    /* Print a matrix (List) */
    public static <T> void printMatrix(List<List<T>> matrix) {
        System.out.println("[");
        for (List<T> row : matrix) {
            System.out.println("  " + row + ",");
        }
        System.out.println("]");
    }

    /* Print a linked list */
    public static void printLinkedList(ListNode head) {
        List<String> list = new ArrayList<>();
        while (head != null) {
            list.add(String.valueOf(head.val));
            head = head.next;
        }
        System.out.println(String.join(" -> ", list));
    }

    /**
     * The interface of the tree printer
     * This tree printer is borrowed from TECHIE DELIGHT
     * https://www.techiedelight.com/c-program-print-binary-tree/
     */
    public static void printTree(TreeNode root) {
        printTree(root, null, false);
    }

    /* Print a binary tree */
    public static void printTree(TreeNode root, Trunk prev, boolean isLeft) {
        if (root == null) {
            return;
        }

        String prev_str = "    ";
        Trunk trunk = new Trunk(prev, prev_str);

        printTree(root.right, trunk, true);

        if (prev == null) {
            trunk.str = "———";
        } else if (isLeft) {
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

    /* Helper function to print branches of the binary tree */
    public static void showTrunks(Trunk p) {
        if (p == null) {
            return;
        }

        showTrunks(p.prev);
        System.out.print(p.str);
    }

    /* Print a hash map */
    public static <K, V> void printHashMap(Map<K, V> map) {
        for (Map.Entry<K, V> kv : map.entrySet()) {
            System.out.println(kv.getKey() + " -> " + kv.getValue());
        }
    }

    /* Print a heap (PriorityQueue) */
    public static void printHeap(Queue<Integer> queue) {
        List<Integer> list = new ArrayList<>(queue);
        System.out.print("堆的数组表示：");
        System.out.println(list);
        System.out.println("堆的树状表示：");
        TreeNode root = TreeNode.listToTree(list);
        printTree(root);
    }
}
