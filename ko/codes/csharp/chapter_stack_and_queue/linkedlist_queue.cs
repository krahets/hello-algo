/**
 * File: linkedlist_queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 연결 리스트로 구현한 큐 */
class LinkedListQueue {
    ListNode? front, rear;  // 머리 노드 front, 꼬리 노드 rear 
    int queSize = 0;

    public LinkedListQueue() {
        front = null;
        rear = null;
    }

    /* 큐의 길이 반환 */
    public int Size() {
        return queSize;
    }

    /* 큐가 비어 있는지 판단 */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* 큐에 삽입 */
    public void Push(int num) {
        // 꼬리 노드 뒤에 num을 추가한다
        ListNode node = new(num);
        // 큐가 비어 있으면 머리와 꼬리 노드가 모두 해당 노드를 가리키게 한다
        if (front == null) {
            front = node;
            rear = node;
            // 큐가 비어 있지 않으면 해당 노드를 꼬리 노드 뒤에 추가한다
        } else if (rear != null) {
            rear.next = node;
            rear = node;
        }
        queSize++;
    }

    /* 큐에서 꺼내기 */
    public int Pop() {
        int num = Peek();
        // 머리 노드를 삭제한다
        front = front?.next;
        queSize--;
        return num;
    }

    /* 맨 앞 원소 접근 */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return front!.val;
    }

    /* 연결 리스트를 Array로 변환하여 반환 */
    public int[] ToArray() {
        if (front == null)
            return [];

        ListNode? node = front;
        int[] res = new int[Size()];
        for (int i = 0; i < res.Length; i++) {
            res[i] = node!.val;
            node = node.next;
        }
        return res;
    }
}

public class linkedlist_queue {
    [Test]
    public void Test() {
        /* 큐 초기화 */
        LinkedListQueue queue = new();

        /* 큐에 원소 삽입 */
        queue.Push(1);
        queue.Push(3);
        queue.Push(2);
        queue.Push(5);
        queue.Push(4);
        Console.WriteLine("큐 queue = " + string.Join(",", queue.ToArray()));

        /* 맨 앞 원소 접근 */
        int peek = queue.Peek();
        Console.WriteLine("맨 앞 원소 peek = " + peek);

        /* 큐에서 원소 꺼내기 */
        int pop = queue.Pop();
        Console.WriteLine("큐에서 꺼낸 원소 pop = " + pop + ", 큐에서 꺼낸 후 queue = " + string.Join(",", queue.ToArray()));

        /* 큐의 길이 반환 */
        int size = queue.Size();
        Console.WriteLine("큐 길이 size = " + size);

        /* 큐가 비어 있는지 판단 */
        bool isEmpty = queue.IsEmpty();
        Console.WriteLine("큐가 비어 있는가 = " + isEmpty);
    }
}
