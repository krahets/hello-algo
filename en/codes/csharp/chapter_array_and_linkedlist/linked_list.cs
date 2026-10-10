// File: linked_list.cs
// Created Time: 2022-12-16
// Author: mingXta (1195669834@qq.com)

namespace hello_algo.chapter_array_and_linkedlist;

public class linked_list {
    /* Insert node P after node n0 in the linked list */
    void Insert(ListNode n0, ListNode P) {
        ListNode? n1 = n0.next;
        P.next = n1;
        n0.next = P;
    }

    /* Remove the first node after node n0 in the linked list */
    void Remove(ListNode n0) {
        if (n0.next == null)
            return;
        // n0 -> P -> n1
        ListNode P = n0.next;
        ListNode? n1 = P.next;
        n0.next = n1;
    }

    /* Access the node at index index in the linked list */
    ListNode? Access(ListNode? head, int index) {
        for (int i = 0; i < index; i++) {
            if (head == null)
                return null;
            head = head.next;
        }
        return head;
    }

    /* Find the first node with value target in the linked list */
    int Find(ListNode? head, int target) {
        int index = 0;
        while (head != null) {
            if (head.val == target)
                return index;
            head = head.next;
            index++;
        }
        return -1;
    }


    [Test]
    public void Test() {
        // Initialize linked list
        // Initialize each node
        ListNode n0 = new(1);
        ListNode n1 = new(3);
        ListNode n2 = new(2);
        ListNode n3 = new(5);
        ListNode n4 = new(4);
        // Build references between nodes
        n0.next = n1;
        n1.next = n2;
        n2.next = n3;
        n3.next = n4;
        Console.WriteLine($"Initialized linked list is{n0}");

        // Insert node
        Insert(n0, new ListNode(0));
        Console.WriteLine($"Linked list after node insertion is{n0}");

        // Remove node
        Remove(n0);
        Console.WriteLine($"Linked list after node deletion is{n0}");

        // Access node
        ListNode? node = Access(n0, 3);
        Console.WriteLine($"Value of node at index 3 in linked list = {node?.val}");

        // Search node
        int index = Find(n0, 2);
        Console.WriteLine($"Index of node with value 2 in linked list = {index}");
    }
}
