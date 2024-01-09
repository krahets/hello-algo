/**
 * File: linkedlist_queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 基于链表实现的队列 */
class LinkedListQueue {
    ListNode? front, rear;  // 头节点 front ，尾节点 rear 
    int queSize = 0;

    public LinkedListQueue() {
        front = null;
        rear = null;
    }

    /* 获取队列的长度 */
    public int Size() {
        return queSize;
    }

    /* 判断队列是否为空 */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* 入队 */
    public void Push(int num) {
        // 在尾节点后添加 num
        ListNode node = new(num);
        // 如果队列为空，则令头、尾节点都指向该节点
        if (front == null) {
            front = node;
            rear = node;
            // 如果队列不为空，则将该节点添加到尾节点后
        } else if (rear != null) {
            rear.next = node;
            rear = node;
        }
        queSize++;
    }

    /* 出队 */
    public int Pop() {
        int num = Peek();
        // 删除头节点
        front = front?.next;
        queSize--;
        return num;
    }

    /* 访问队首元素 */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return front!.val;
    }

    /* 将链表转化为 Array 并返回 */
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
        /* 初始化队列 */
        LinkedListQueue queue = new();

        /* 元素入队 */
        queue.Push(1);
        queue.Push(3);
        queue.Push(2);
        queue.Push(5);
        queue.Push(4);
        Console.WriteLine("队列 queue = " + string.Join(",", queue.ToArray()));

        /* 访问队首元素 */
        int peek = queue.Peek();
        Console.WriteLine("队首元素 peek = " + peek);

        /* 元素出队 */
        int pop = queue.Pop();
        Console.WriteLine("出队元素 pop = " + pop + "，出队后 queue = " + string.Join(",", queue.ToArray()));

        /* 获取队列的长度 */
        int size = queue.Size();
        Console.WriteLine("队列长度 size = " + size);

        /* 判断队列是否为空 */
        bool isEmpty = queue.IsEmpty();
        Console.WriteLine("队列是否为空 = " + isEmpty);
    }
}
