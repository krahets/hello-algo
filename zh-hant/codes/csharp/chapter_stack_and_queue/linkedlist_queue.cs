/**
 * File: linkedlist_queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 以鏈結串列實作佇列 */
class LinkedListQueue {
    ListNode? front, rear;  // front 指向首節點，rear 指向尾節點 
    int queSize = 0;

    public LinkedListQueue() {
        front = null;
        rear = null;
    }

    /* 取得佇列長度 */
    public int Size() {
        return queSize;
    }

    /* 判斷佇列是否為空 */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* 入隊 */
    public void Push(int num) {
        // 建立存有 num 的新節點，準備接到隊尾
        ListNode node = new(num);
        // 若佇列為空，讓隊首與隊尾都指向新節點
        if (front == null) {
            front = node;
            rear = node;
            // 若佇列非空，將新節點接在尾節點之後
        } else if (rear != null) {
            rear.next = node;
            rear = node;
        }
        queSize++;
    }

    /* 出隊 */
    public int Pop() {
        int num = Peek();
        // 移除首節點
        front = front?.next;
        queSize--;
        return num;
    }

    /* 讀取隊首元素 */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return front!.val;
    }

    /* 將鏈結串列轉成陣列並回傳 */
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
        /* 初始化佇列 */
        LinkedListQueue queue = new();

        /* 將元素加入佇列 */
        queue.Push(1);
        queue.Push(3);
        queue.Push(2);
        queue.Push(5);
        queue.Push(4);
        Console.WriteLine("佇列 queue = " + string.Join(",", queue.ToArray()));

        /* 讀取隊首元素 */
        int peek = queue.Peek();
        Console.WriteLine("隊首元素 peek = " + peek);

        /* 從佇列取出元素 */
        int pop = queue.Pop();
        Console.WriteLine("出隊元素 pop = " + pop + "，出隊後 queue = " + string.Join(",", queue.ToArray()));

        /* 取得佇列長度 */
        int size = queue.Size();
        Console.WriteLine("佇列長度 size = " + size);

        /* 判斷佇列是否為空 */
        bool isEmpty = queue.IsEmpty();
        Console.WriteLine("佇列是否為空 = " + isEmpty);
    }
}
