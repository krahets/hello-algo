/**
 * File: linked_list.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import utils.*;

public class linked_list {
    /* 連結リストのノード n0 の直後にノード P を挿入する */
    static void insert(ListNode n0, ListNode P) {
        ListNode n1 = n0.next;
        P.next = n1;
        n0.next = P;
    }

    /* 連結リストのノード n0 の直後のノードを削除する */
    static void remove(ListNode n0) {
        if (n0.next == null)
            return;
        // n0 -> P -> n1
        ListNode P = n0.next;
        ListNode n1 = P.next;
        n0.next = n1;
    }

    /* 連結リストのインデックス index にあるノードにアクセスする */
    static ListNode access(ListNode head, int index) {
        for (int i = 0; i < index; i++) {
            if (head == null)
                return null;
            head = head.next;
        }
        return head;
    }

    /* 連結リストから値が target である最初のノードを探索する */
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

    /* 実行用コード */
    public static void main(String[] args) {
        /* 連結リストを初期化する */
        // 各ノードを初期化する
        ListNode n0 = new ListNode(1);
        ListNode n1 = new ListNode(3);
        ListNode n2 = new ListNode(2);
        ListNode n3 = new ListNode(5);
        ListNode n4 = new ListNode(4);
        // ノード間の参照を設定する
        n0.next = n1;
        n1.next = n2;
        n2.next = n3;
        n3.next = n4;
        System.out.println("初期化した連結リスト");
        PrintUtil.printLinkedList(n0);

        /* ノードを挿入する */
        insert(n0, new ListNode(0));
        System.out.println("ノードを挿入した後の連結リスト");
        PrintUtil.printLinkedList(n0);

        /* ノードを削除する */
        remove(n0);
        System.out.println("ノードを削除した後の連結リスト");
        PrintUtil.printLinkedList(n0);

        /* ノードにアクセスする */
        ListNode node = access(n0, 3);
        System.out.println("連結リストのインデックス 3 にあるノードの値 = " + node.val);

        /* ノードを探索する */
        int index = find(n0, 2);
        System.out.println("連結リスト内で値が 2 であるノードのインデックス = " + index);
    }
}
