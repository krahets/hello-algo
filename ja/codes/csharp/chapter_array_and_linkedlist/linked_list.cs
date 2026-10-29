// File: linked_list.cs
// Created Time: 2022-12-16
// Author: mingXta (1195669834@qq.com)

namespace hello_algo.chapter_array_and_linkedlist;

public class linked_list {
    /* 連結リストのノード n0 の直後にノード P を挿入する */
    void Insert(ListNode n0, ListNode P) {
        ListNode? n1 = n0.next;
        P.next = n1;
        n0.next = P;
    }

    /* 連結リストのノード n0 の直後のノードを削除する */
    void Remove(ListNode n0) {
        if (n0.next == null)
            return;
        // n0 -> P -> n1
        ListNode P = n0.next;
        ListNode? n1 = P.next;
        n0.next = n1;
    }

    /* 連結リストのインデックス index にあるノードにアクセスする */
    ListNode? Access(ListNode? head, int index) {
        for (int i = 0; i < index; i++) {
            if (head == null)
                return null;
            head = head.next;
        }
        return head;
    }

    /* 連結リストから値が target である最初のノードを探索する */
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
        // 連結リストを初期化する 
        // 各ノードを初期化する 
        ListNode n0 = new(1);
        ListNode n1 = new(3);
        ListNode n2 = new(2);
        ListNode n3 = new(5);
        ListNode n4 = new(4);
        // ノード間の参照を設定する
        n0.next = n1;
        n1.next = n2;
        n2.next = n3;
        n3.next = n4;
        Console.WriteLine($"初期化した連結リスト{n0}");

        // ノードを挿入する 
        Insert(n0, new ListNode(0));
        Console.WriteLine($"ノードを挿入した後の連結リスト{n0}");

        // ノードを削除する 
        Remove(n0);
        Console.WriteLine($"ノードを削除した後の連結リスト{n0}");

        // ノードにアクセスする 
        ListNode? node = Access(n0, 3);
        Console.WriteLine($"連結リストのインデックス 3 にあるノードの値 = {node?.val}");

        // ノードを探索する 
        int index = Find(n0, 2);
        Console.WriteLine($"連結リスト内で値が 2 であるノードのインデックス = {index}");
    }
}
