/**
 * File: linkedlist_deque.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 雙向鏈結串列的節點 */
public class ListNode(int val) {
    public int val = val;       // 節點值
    public ListNode? next = null; // 指向下一個節點的參照
    public ListNode? prev = null; // 指向上一個節點的參照
}

/* 以雙向鏈結串列實作雙端佇列 */
public class LinkedListDeque {
    ListNode? front, rear; // front 指向首節點，rear 指向尾節點
    int queSize = 0;      // 雙端佇列長度

    public LinkedListDeque() {
        front = null;
        rear = null;
    }

    /* 取得雙端佇列長度 */
    public int Size() {
        return queSize;
    }

    /* 判斷雙端佇列是否為空 */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* 加入元素 */
    void Push(int num, bool isFront) {
        ListNode node = new(num);
        // 若鏈結串列為空，讓 front 和 rear 都指向 node
        if (IsEmpty()) {
            front = node;
            rear = node;
        }
        // 從隊首加入元素
        else if (isFront) {
            // 將 node 加到鏈結串列的開頭
            front!.prev = node;
            node.next = front;
            front = node; // 更新首節點                           
        }
        // 從隊尾加入元素
        else {
            // 將 node 加到鏈結串列的末端
            rear!.next = node;
            node.prev = rear;
            rear = node;  // 更新尾節點
        }

        queSize++; // 將雙端佇列長度加 1
    }

    /* 從隊首加入元素 */
    public void PushFirst(int num) {
        Push(num, true);
    }

    /* 從隊尾加入元素 */
    public void PushLast(int num) {
        Push(num, false);
    }

    /* 取出元素 */
    int? Pop(bool isFront) {
        if (IsEmpty())
            throw new Exception();
        int? val;
        // 佇列長度為 1 時，首尾兩端指向同一個節點
        if (queSize == 1) {
            val = front!.val;
            front = null;
            rear = null;
        }
        // 從隊首取出元素
        else if (isFront) {
            val = front!.val; // 暫存首節點的值
            // 移除首節點
            ListNode? fNext = front?.next;
            fNext!.prev = null;
            front.next = null;
            front = fNext;   // 更新首節點
        }
        // 從隊尾取出元素
        else {
            val = rear!.val;  // 暫存尾節點的值
            // 移除尾節點
            ListNode? rPrev = rear?.prev;
            rPrev!.next = null;
            rear.prev = null;
            rear = rPrev;    // 更新尾節點
        }

        queSize--; // 將雙端佇列長度減 1
        return val;
    }

    /* 從隊首取出元素 */
    public int? PopFirst() {
        return Pop(true);
    }

    /* 從隊尾取出元素 */
    public int? PopLast() {
        return Pop(false);
    }

    /* 讀取隊首元素 */
    public int? PeekFirst() {
        if (IsEmpty())
            throw new Exception();
        return front?.val;
    }

    /* 讀取隊尾元素 */
    public int? PeekLast() {
        if (IsEmpty())
            throw new Exception();
        return rear?.val;
    }

    /* 回傳陣列以便輸出 */
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
        /* 初始化雙端佇列 */
        LinkedListDeque deque = new();
        deque.PushLast(3);
        deque.PushLast(2);
        deque.PushLast(5);
        Console.WriteLine("雙端佇列 deque = " + string.Join(" ", deque.ToArray()));

        /* 讀取隊首與隊尾元素 */
        int? peekFirst = deque.PeekFirst();
        Console.WriteLine("隊首元素 peekFirst = " + peekFirst);
        int? peekLast = deque.PeekLast();
        Console.WriteLine("隊尾元素 peekLast = " + peekLast);

        /* 將元素加入雙端佇列 */
        deque.PushLast(4);
        Console.WriteLine("將元素 4 加到隊尾後 deque = " + string.Join(" ", deque.ToArray()));
        deque.PushFirst(1);
        Console.WriteLine("將元素 1 加到隊首後 deque = " + string.Join(" ", deque.ToArray()));

        /* 從雙端佇列取出元素 */
        int? popLast = deque.PopLast();
        Console.WriteLine("從隊尾取出的元素 = " + popLast + "，從隊尾取出後 deque = " + string.Join(" ", deque.ToArray()));
        int? popFirst = deque.PopFirst();
        Console.WriteLine("從隊首取出的元素 = " + popFirst + "，從隊首取出後 deque = " + string.Join(" ", deque.ToArray()));

        /* 取得雙端佇列長度 */
        int size = deque.Size();
        Console.WriteLine("雙端佇列長度 size = " + size);

        /* 判斷雙端佇列是否為空 */
        bool isEmpty = deque.IsEmpty();
        Console.WriteLine("雙端佇列是否為空 = " + isEmpty);
    }
}
