/**
 * File: linkedlist_queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 基於鏈結串列實現的佇列 */
class LinkedListQueue {
    ListNode? front, rear;  // 頭節點 front ，尾節點 rear 
    int queSize = 0;

    public LinkedListQueue() {
        front = null;
        rear = null;
    }

    /* 獲取佇列的長度 */
    public int Size() {
        return queSize;
    }

    /* 判斷佇列是否為空 */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* 入列 */
    public void Push(int num) {
        // 在尾節點後新增 num
        ListNode node = new(num);
        // 如果佇列為空，則令頭、尾節點都指向該節點
        if (front == null) {
            front = node;
            rear = node;
            // 如果佇列不為空，則將該節點新增到尾節點後
        } else if (rear != null) {
            rear.next = node;
            rear = node;
        }
        queSize++;
    }

    /* 出列 */
    public int Pop() {
        int num = Peek();
        // 刪除頭節點
        front = front?.next;
        queSize--;
        return num;
    }

    /* 訪問佇列首元素 */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return front!.val;
    }

    /* 將鏈結串列轉化為 Array 並返回 */
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

        /* 元素入列 */
        queue.Push(1);
        queue.Push(3);
        queue.Push(2);
        queue.Push(5);
        queue.Push(4);
        Console.WriteLine("佇列 queue = " + string.Join(",", queue.ToArray()));

        /* 訪問佇列首元素 */
        int peek = queue.Peek();
        Console.WriteLine("佇列首元素 peek = " + peek);

        /* 元素出列 */
        int pop = queue.Pop();
        Console.WriteLine("出列元素 pop = " + pop + "，出列後 queue = " + string.Join(",", queue.ToArray()));

        /* 獲取佇列的長度 */
        int size = queue.Size();
        Console.WriteLine("佇列長度 size = " + size);

        /* 判斷佇列是否為空 */
        bool isEmpty = queue.IsEmpty();
        Console.WriteLine("佇列是否為空 = " + isEmpty);
    }
}
