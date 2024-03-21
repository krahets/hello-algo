// File: linked_list.cs
// Created Time: 2022-12-16
// Author: mingXta (1195669834@qq.com)

namespace hello_algo.chapter_array_and_linkedlist;

public class linked_list {
    /* 在鏈結串列的節點 n0 之後插入節點 P */
    void Insert(ListNode n0, ListNode P) {
        ListNode? n1 = n0.next;
        P.next = n1;
        n0.next = P;
    }

    /* 刪除鏈結串列的節點 n0 之後的首個節點 */
    void Remove(ListNode n0) {
        if (n0.next == null)
            return;
        // n0 -> P -> n1
        ListNode P = n0.next;
        ListNode? n1 = P.next;
        n0.next = n1;
    }

    /* 訪問鏈結串列中索引為 index 的節點 */
    ListNode? Access(ListNode? head, int index) {
        for (int i = 0; i < index; i++) {
            if (head == null)
                return null;
            head = head.next;
        }
        return head;
    }

    /* 在鏈結串列中查詢值為 target 的首個節點 */
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
        // 初始化鏈結串列 
        // 初始化各個節點 
        ListNode n0 = new(1);
        ListNode n1 = new(3);
        ListNode n2 = new(2);
        ListNode n3 = new(5);
        ListNode n4 = new(4);
        // 構建節點之間的引用
        n0.next = n1;
        n1.next = n2;
        n2.next = n3;
        n3.next = n4;
        Console.WriteLine($"初始化的鏈結串列為{n0}");

        // 插入節點 
        Insert(n0, new ListNode(0));
        Console.WriteLine($"插入節點後的鏈結串列為{n0}");

        // 刪除節點 
        Remove(n0);
        Console.WriteLine($"刪除節點後的鏈結串列為{n0}");

        // 訪問節點 
        ListNode? node = Access(n0, 3);
        Console.WriteLine($"鏈結串列中索引 3 處的節點的值 = {node?.val}");

        // 查詢節點 
        int index = Find(n0, 2);
        Console.WriteLine($"鏈結串列中值為 2 的節點的索引 = {index}");
    }
}
