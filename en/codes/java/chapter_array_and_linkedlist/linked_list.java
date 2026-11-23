/**
 * File: linked_list.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_array_and_linkedlist;

import utils.*;

public class linked_list {
    /* Insert node P after node n0 in the linked list */
    static void insert(ListNode n0, ListNode P) {
        ListNode n1 = n0.next;
        P.next = n1;
        n0.next = P;
    }

    /* Remove the first node after node n0 in the linked list */
    static void remove(ListNode n0) {
        if (n0.next == null)
            return;
        // n0 -> P -> n1
        ListNode P = n0.next;
        ListNode n1 = P.next;
        n0.next = n1;
    }

    /* Access the node at index `index` in the linked list */
    static ListNode access(ListNode head, int index) {
        for (int i = 0; i < index; i++) {
            if (head == null)
                return null;
            head = head.next;
        }
        return head;
    }

    /* Find the first node with value target in the linked list */
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

    /* Driver code */
    public static void main(String[] args) {
        /* Initialize the linked list */
        // Initialize the individual nodes
        ListNode n0 = new ListNode(1);
        ListNode n1 = new ListNode(3);
        ListNode n2 = new ListNode(2);
        ListNode n3 = new ListNode(5);
        ListNode n4 = new ListNode(4);
        // Set up references between the nodes
        n0.next = n1;
        n1.next = n2;
        n2.next = n3;
        n3.next = n4;
        System.out.println("The initialized linked list is");
        PrintUtil.printLinkedList(n0);

        /* Insert a node */
        insert(n0, new ListNode(0));
        System.out.println("The linked list after inserting a node is");
        PrintUtil.printLinkedList(n0);

        /* Remove a node */
        remove(n0);
        System.out.println("The linked list after removing a node is");
        PrintUtil.printLinkedList(n0);

        /* Access a node */
        ListNode node = access(n0, 3);
        System.out.println("Value of the node at index 3 in the linked list = " + node.val);

        /* Find a node */
        int index = find(n0, 2);
        System.out.println("Index of the node with value 2 in the linked list = " + index);
    }
}
