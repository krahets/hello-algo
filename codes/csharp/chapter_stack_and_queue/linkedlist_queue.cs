/**
 * File: linkedlist_queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 基于链表实现的队列 */
class LinkedListQueue {
    private ListNode? front, rear;  // 头节点 front ，尾节点 rear 
    private int queSize = 0;

    public LinkedListQueue() {
        front = null;
        rear = null;
    }

    /* 获取队列的长度 */
    public int size() {
        return queSize;
    }

    /* 判断队列是否为空 */
    public bool isEmpty() {
        return size() == 0;
    }

    /* 入队 */
    public void push(int num) {
        // 尾节点后添加 num
        ListNode node = new ListNode(num);
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
    public int pop() {
        int num = peek();
        // 删除头节点
        front = front?.next;
        queSize--;
        return num;
    }

    /* 访问队首元素 */
    public int peek() {
        if (size() == 0 || front == null)
            throw new Exception();
        return front.val;
    }

    /* 将链表转化为 Array 并返回 */
    public int[] toArray() {
        if (front == null)
            return Array.Empty<int>();

        ListNode node = front;
        int[] res = new int[size()];
        for (int i = 0; i < res.Length; i++) {
            res[i] = node.val;
            node = node.next;
        }
        return res;
    }
}

public class linkedlist_queue {
    [Test]
    public void Test() {
        /* 初始化队列 */
        LinkedListQueue queue = new LinkedListQueue();

        /* 元素入队 */
        queue.push(1);
        queue.push(3);
        queue.push(2);
        queue.push(5);
        queue.push(4);
        Console.WriteLine("队列 queue = " + string.Join(",", queue.toArray()));

        /* 访问队首元素 */
        int peek = queue.peek();
        Console.WriteLine("队首元素 peek = " + peek);

        /* 元素出队 */
        int pop = queue.pop();
        Console.WriteLine("出队元素 pop = " + pop + "，出队后 queue = " + string.Join(",", queue.toArray()));

        /* 获取队列的长度 */
        int size = queue.size();
        Console.WriteLine("队列长度 size = " + size);

        /* 判断队列是否为空 */
        bool isEmpty = queue.isEmpty();
        Console.WriteLine("队列是否为空 = " + isEmpty);
    }
}
