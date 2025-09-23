/**
 * File: linked_list.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import utils.*;

public class linked_list {
    /* 連結リストでノード n0 の後にノード P を挿入 */
    static void insert(ListNode n0, ListNode P) {
        ListNode n1 = n0.next;
        P.next = n1;
        n0.next = P;
    }

    /* 連結リストでノード n0 の後の最初のノードを削除 */
    static void remove(ListNode n0) {
        if (n0.next == null)
            return;
        // n0 -> P -> n1
        ListNode P = n0.next;
        ListNode n1 = P.next;
        n0.next = n1;
    }

    /* 連結リストの `index` のノードにアクセス */
    static ListNode access(ListNode head, int index) {
        for (int i = 0; i < index; i++) {
            if (head == null)
                return null;
            head = head.next;
        }
        return head;
    }

    /* 連結リストで値 target を持つ最初のノードを検索 */
    static int find(ListNode head, int target) {
        int index = 0;
        while (head != null) {
            if (head.val == target)
                return index;
            head = head.next;
            index++;
        }
        return -1;
    }

    /* ドライバーコード */
    public static void main(String[] args) {
        /* 連結リストの初期化 */
        // 各ノードを初期化
        ListNode n0 = new ListNode(1);
        ListNode n1 = new ListNode(3);
        ListNode n2 = new ListNode(2);
        ListNode n3 = new ListNode(5);
        ListNode n4 = new ListNode(4);
        // ノード間の参照を構築
        n0.next = n1;
        n1.next = n2;
        n2.next = n3;
        n3.next = n4;
        System.out.println("初期化された連結リストは");
        PrintUtil.printLinkedList(n0);

        /* ノードの挿入 */
        insert(n0, new ListNode(0));
        System.out.println("ノード挿入後の連結リストは");
        PrintUtil.printLinkedList(n0);

        /* ノードの削除 */
        remove(n0);
        System.out.println("ノード削除後の連結リストは");
        PrintUtil.printLinkedList(n0);

        /* ノードへのアクセス */
        ListNode node = access(n0, 3);
        System.out.println("連結リストのインデックス3のノードの値 = " + node.val);

        /* ノードの検索 */
        int index = find(n0, 2);
        System.out.println("連結リストで値2を持つノードのインデックス = " + index);
    }
}