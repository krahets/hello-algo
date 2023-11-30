/**
 * File: linkedlist_deque.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 双向链表节点 */
public class ListNode(int val) {
    public int val = val;       // 节点值
    public ListNode? next = null; // 后继节点引用
    public ListNode? prev = null; // 前驱节点引用
}

/* 基于双向链表实现的双向队列 */
public class LinkedListDeque {
    ListNode? front, rear; // 头节点 front, 尾节点 rear
    int queSize = 0;      // 双向队列的长度

    public LinkedListDeque() {
        front = null;
        rear = null;
    }

    /* 获取双向队列的长度 */
    public int Size() {
        return queSize;
    }

    /* 判断双向队列是否为空 */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* 入队操作 */
    void Push(int num, bool isFront) {
        ListNode node = new(num);
        // 若链表为空，则令 front 和 rear 都指向 node
        if (IsEmpty()) {
            front = node;
            rear = node;
        }
        // 队首入队操作
        else if (isFront) {
            // 将 node 添加至链表头部
            front!.prev = node;
            node.next = front;
            front = node; // 更新头节点                           
        }
        // 队尾入队操作
        else {
            // 将 node 添加至链表尾部
            rear!.next = node;
            node.prev = rear;
            rear = node;  // 更新尾节点
        }

        queSize++; // 更新队列长度
    }

    /* 队首入队 */
    public void PushFirst(int num) {
        Push(num, true);
    }

    /* 队尾入队 */
    public void PushLast(int num) {
        Push(num, false);
    }

    /* 出队操作 */
    int? Pop(bool isFront) {
        if (IsEmpty())
            throw new Exception();
        int? val;
        // 队首出队操作
        if (isFront) {
            val = front?.val; // 暂存头节点值
            // 删除头节点
            ListNode? fNext = front?.next;
            if (fNext != null) {
                fNext.prev = null;
                front!.next = null;
            }
            front = fNext;   // 更新头节点
        }
        // 队尾出队操作
        else {
            val = rear?.val;  // 暂存尾节点值
            // 删除尾节点
            ListNode? rPrev = rear?.prev;
            if (rPrev != null) {
                rPrev.next = null;
                rear!.prev = null;
            }
            rear = rPrev;    // 更新尾节点
        }

        queSize--; // 更新队列长度
        return val;
    }

    /* 队首出队 */
    public int? PopFirst() {
        return Pop(true);
    }

    /* 队尾出队 */
    public int? PopLast() {
        return Pop(false);
    }

    /* 访问队首元素 */
    public int? PeekFirst() {
        if (IsEmpty())
            throw new Exception();
        return front?.val;
    }

    /* 访问队尾元素 */
    public int? PeekLast() {
        if (IsEmpty())
            throw new Exception();
        return rear?.val;
    }

    /* 返回数组用于打印 */
    public int?[] ToArray() {
        ListNode? node = front;
        int?[] res = new int?[Size()];
        for (int i = 0; i < res.Length; i++) {
            res[i] = node?.val;
            node = node?.next;
        }

        return res;
    }
}

public class linkedlist_deque {
    [Test]
    public void Test() {
        /* 初始化双向队列 */
        LinkedListDeque deque = new();
        deque.PushLast(3);
        deque.PushLast(2);
        deque.PushLast(5);
        Console.WriteLine("双向队列 deque = " + string.Join(" ", deque.ToArray()));

        /* 访问元素 */
        int? peekFirst = deque.PeekFirst();
        Console.WriteLine("队首元素 peekFirst = " + peekFirst);
        int? peekLast = deque.PeekLast();
        Console.WriteLine("队尾元素 peekLast = " + peekLast);

        /* 元素入队 */
        deque.PushLast(4);
        Console.WriteLine("元素 4 队尾入队后 deque = " + string.Join(" ", deque.ToArray()));
        deque.PushFirst(1);
        Console.WriteLine("元素 1 队首入队后 deque = " + string.Join(" ", deque.ToArray()));

        /* 元素出队 */
        int? popLast = deque.PopLast();
        Console.WriteLine("队尾出队元素 = " + popLast + "，队尾出队后 deque = " + string.Join(" ", deque.ToArray()));
        int? popFirst = deque.PopFirst();
        Console.WriteLine("队首出队元素 = " + popFirst + "，队首出队后 deque = " + string.Join(" ", deque.ToArray()));

        /* 获取双向队列的长度 */
        int size = deque.Size();
        Console.WriteLine("双向队列长度 size = " + size);

        /* 判断双向队列是否为空 */
        bool isEmpty = deque.IsEmpty();
        Console.WriteLine("双向队列是否为空 = " + isEmpty);
    }
}
