// File: linked_list.cs
// Created Time: 2022-12-16
// Author: mingXta (1195669834@qq.com)

namespace hello_algo.chapter_array_and_linkedlist;

public class linked_list {
    /* 연결 리스트의 노드 n0 뒤에 노드 P 삽입 */
    void Insert(ListNode n0, ListNode P) {
        ListNode? n1 = n0.next;
        P.next = n1;
        n0.next = P;
    }

    /* 연결 리스트의 노드 n0 바로 뒤에 있는 노드 삭제 */
    void Remove(ListNode n0) {
        if (n0.next == null)
            return;
        // n0 -> P -> n1
        ListNode P = n0.next;
        ListNode? n1 = P.next;
        n0.next = n1;
    }

    /* 연결 리스트에서 인덱스가 index인 노드에 접근 */
    ListNode? Access(ListNode? head, int index) {
        for (int i = 0; i < index; i++) {
            if (head == null)
                return null;
            head = head.next;
        }
        return head;
    }

    /* 연결 리스트에서 값이 target인 첫 번째 노드 탐색 */
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
        // 연결 리스트 초기화 
        // 각 노드를 초기화한다 
        ListNode n0 = new(1);
        ListNode n1 = new(3);
        ListNode n2 = new(2);
        ListNode n3 = new(5);
        ListNode n4 = new(4);
        // 노드 사이의 참조를 설정한다
        n0.next = n1;
        n1.next = n2;
        n2.next = n3;
        n3.next = n4;
        Console.WriteLine($"초기화한 연결 리스트: {n0}");

        // 노드 삽입 
        Insert(n0, new ListNode(0));
        Console.WriteLine($"노드를 삽입한 뒤의 연결 리스트: {n0}");

        // 노드 삭제 
        Remove(n0);
        Console.WriteLine($"노드를 삭제한 뒤의 연결 리스트: {n0}");

        // 노드 접근 
        ListNode? node = Access(n0, 3);
        Console.WriteLine($"연결 리스트에서 인덱스 3의 노드 값 = {node?.val}");

        // 노드 탐색 
        int index = Find(n0, 2);
        Console.WriteLine($"연결 리스트에서 값이 2인 노드의 인덱스 = {index}");
    }
}
