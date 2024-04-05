/**
 * File: linkedlist_deque.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 雙向鏈結串列節點 */
public class ListNode(int val) {
    public int val = val;       // 節點值
    public ListNode? next = null; // 後繼節點引用
    public ListNode? prev = null; // 前驅節點引用
}

/* 基於雙向鏈結串列實現的雙向佇列 */
public class LinkedListDeque {
    ListNode? front, rear; // 頭節點 front, 尾節點 rear
    int queSize = 0;      // 雙向佇列的長度

    public LinkedListDeque() {
        front = null;
        rear = null;
    }

    /* 獲取雙向佇列的長度 */
    public int Size() {
        return queSize;
    }

    /* 判斷雙向佇列是否為空 */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* 入列操作 */
    void Push(int num, bool isFront) {
        ListNode node = new(num);
        // 若鏈結串列為空，則令 front 和 rear 都指向 node
        if (IsEmpty()) {
            front = node;
            rear = node;
        }
        // 佇列首入列操作
        else if (isFront) {
            // 將 node 新增至鏈結串列頭部
            front!.prev = node;
            node.next = front;
            front = node; // 更新頭節點                           
        }
        // 佇列尾入列操作
        else {
            // 將 node 新增至鏈結串列尾部
            rear!.next = node;
            node.prev = rear;
            rear = node;  // 更新尾節點
        }

        queSize++; // 更新佇列長度
    }

    /* 佇列首入列 */
    public void PushFirst(int num) {
        Push(num, true);
    }

    /* 佇列尾入列 */
    public void PushLast(int num) {
        Push(num, false);
    }

    /* 出列操作 */
    int? Pop(bool isFront) {
        if (IsEmpty())
            throw new Exception();
        int? val;
        // 佇列首出列操作
        if (isFront) {
            val = front?.val; // 暫存頭節點值
            // 刪除頭節點
            ListNode? fNext = front?.next;
            if (fNext != null) {
                fNext.prev = null;
                front!.next = null;
            }
            front = fNext;   // 更新頭節點
        }
        // 佇列尾出列操作
        else {
            val = rear?.val;  // 暫存尾節點值
            // 刪除尾節點
            ListNode? rPrev = rear?.prev;
            if (rPrev != null) {
                rPrev.next = null;
                rear!.prev = null;
            }
            rear = rPrev;    // 更新尾節點
        }

        queSize--; // 更新佇列長度
        return val;
    }

    /* 佇列首出列 */
    public int? PopFirst() {
        return Pop(true);
    }

    /* 佇列尾出列 */
    public int? PopLast() {
        return Pop(false);
    }

    /* 訪問佇列首元素 */
    public int? PeekFirst() {
        if (IsEmpty())
            throw new Exception();
        return front?.val;
    }

    /* 訪問佇列尾元素 */
    public int? PeekLast() {
        if (IsEmpty())
            throw new Exception();
        return rear?.val;
    }

    /* 返回陣列用於列印 */
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
        /* 初始化雙向佇列 */
        LinkedListDeque deque = new();
        deque.PushLast(3);
        deque.PushLast(2);
        deque.PushLast(5);
        Console.WriteLine("雙向佇列 deque = " + string.Join(" ", deque.ToArray()));

        /* 訪問元素 */
        int? peekFirst = deque.PeekFirst();
        Console.WriteLine("佇列首元素 peekFirst = " + peekFirst);
        int? peekLast = deque.PeekLast();
        Console.WriteLine("佇列尾元素 peekLast = " + peekLast);

        /* 元素入列 */
        deque.PushLast(4);
        Console.WriteLine("元素 4 佇列尾入列後 deque = " + string.Join(" ", deque.ToArray()));
        deque.PushFirst(1);
        Console.WriteLine("元素 1 佇列首入列後 deque = " + string.Join(" ", deque.ToArray()));

        /* 元素出列 */
        int? popLast = deque.PopLast();
        Console.WriteLine("佇列尾出列元素 = " + popLast + "，佇列尾出列後 deque = " + string.Join(" ", deque.ToArray()));
        int? popFirst = deque.PopFirst();
        Console.WriteLine("佇列首出列元素 = " + popFirst + "，佇列首出列後 deque = " + string.Join(" ", deque.ToArray()));

        /* 獲取雙向佇列的長度 */
        int size = deque.Size();
        Console.WriteLine("雙向佇列長度 size = " + size);

        /* 判斷雙向佇列是否為空 */
        bool isEmpty = deque.IsEmpty();
        Console.WriteLine("雙向佇列是否為空 = " + isEmpty);
    }
}
