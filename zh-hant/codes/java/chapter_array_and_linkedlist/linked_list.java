/**
 * File: linked_list.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import utils.*;

public class linked_list {
    /* 在鏈結串列的節點 n0 之後插入節點 P */
    static void insert(ListNode n0, ListNode P) {
        ListNode n1 = n0.next;
        P.next = n1;
        n0.next = P;
    }

    /* 刪除鏈結串列中緊接在節點 n0 之後的節點 */
    static void remove(ListNode n0) {
        if (n0.next == null)
            return;
        // n0 -> P -> n1
        ListNode P = n0.next;
        ListNode n1 = P.next;
        n0.next = n1;
    }

    /* 存取鏈結串列中索引為 index 的節點 */
    static ListNode access(ListNode head, int index) {
        for (int i = 0; i < index; i++) {
            if (head == null)
                return null;
            head = head.next;
        }
        return head;
    }

    /* 在鏈結串列中尋找第一個值為 target 的節點 */
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

    /* 範例主程式 */
    public static void main(String[] args) {
        /* 初始化鏈結串列 */
        // 初始化各個節點
        ListNode n0 = new ListNode(1);
        ListNode n1 = new ListNode(3);
        ListNode n2 = new ListNode(2);
        ListNode n3 = new ListNode(5);
        ListNode n4 = new ListNode(4);
        // 建立節點之間的參照
        n0.next = n1;
        n1.next = n2;
        n2.next = n3;
        n3.next = n4;
        System.out.println("初始化後的鏈結串列為");
        PrintUtil.printLinkedList(n0);

        /* 插入節點 */
        insert(n0, new ListNode(0));
        System.out.println("插入節點後的鏈結串列為");
        PrintUtil.printLinkedList(n0);

        /* 刪除節點 */
        remove(n0);
        System.out.println("刪除節點後的鏈結串列為");
        PrintUtil.printLinkedList(n0);

        /* 存取節點 */
        ListNode node = access(n0, 3);
        System.out.println("鏈結串列中索引 3 處的節點值 = " + node.val);

        /* 尋找節點 */
        int index = find(n0, 2);
        System.out.println("鏈結串列中值為 2 的節點索引 = " + index);
    }
}
