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
    /* 행렬 출력(Array) */
    public static <T> void printMatrix(T[][] matrix) {
        System.out.println("[");
        for (T[] row : matrix) {
            System.out.println("  " + row + ",");
        }
        System.out.println("]");
    }

    /* 행렬 출력(List) */
    public static <T> void printMatrix(List<List<T>> matrix) {
        System.out.println("[");
        for (List<T> row : matrix) {
            System.out.println("  " + row + ",");
        }
        System.out.println("]");
    }

    /* 연결 리스트 출력 */
    public static void printLinkedList(ListNode head) {
        List<String> list = new ArrayList<>();
        while (head != null) {
            list.add(String.valueOf(head.val));
            head = head.next;
        }
        System.out.println(String.join(" -> ", list));
    }

    /* 이진 트리 출력 */
    public static void printTree(TreeNode root) {
        printTree(root, null, false);
    }

    /**
     * 이진 트리 출력
     * 이 트리 출력 코드는 TECHIE DELIGHT에서 가져왔다
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

    /* 해시 테이블 출력 */
    public static <K, V> void printHashMap(Map<K, V> map) {
        for (Map.Entry<K, V> kv : map.entrySet()) {
            System.out.println(kv.getKey() + " -> " + kv.getValue());
        }
    }

    /* 힙(우선순위 큐) 출력 */
    public static void printHeap(Queue<Integer> queue) {
        List<Integer> list = new ArrayList<>(queue);
        System.out.print("힙의 배열 표현:");
        System.out.println(list);
        System.out.println("힙의 트리 표현:");
        TreeNode root = TreeNode.listToTree(list);
        printTree(root);
    }
}
