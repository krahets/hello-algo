/**
 * File: linkedlist_deque.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 双方向連結リストのノード */
public class ListNode(int val) {
    public int val = val;       // ノードの値
    public ListNode? next = null; // 後続ノードへの参照
    public ListNode? prev = null; // 前のノードへの参照
}

/* 双方向連結リストで実装した両端キュー */
public class LinkedListDeque {
    ListNode? front, rear; // 先頭ノード front、末尾ノード rear
    int queSize = 0;      // 両端キューの長さ

    public LinkedListDeque() {
        front = null;
        rear = null;
    }

    /* 両端キューの長さを取得する */
    public int Size() {
        return queSize;
    }

    /* 両端キューが空かどうかを判定する */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* エンキュー操作 */
    void Push(int num, bool isFront) {
        ListNode node = new(num);
        // 連結リストが空の場合、front と rear の両方が node を指すようにする
        if (IsEmpty()) {
            front = node;
            rear = node;
        }
        // 先頭へのエンキュー操作
        else if (isFront) {
            // node を連結リストの先頭に追加する
            front!.prev = node;
            node.next = front;
            front = node; // 先頭ノードを更新する                           
        }
        // 末尾へのエンキュー操作
        else {
            // node を連結リストの末尾に追加する
            rear!.next = node;
            node.prev = rear;
            rear = node;  // 末尾ノードを更新する
        }

        queSize++; // キューの長さを更新する
    }

    /* 先頭にエンキューする */
    public void PushFirst(int num) {
        Push(num, true);
    }

    /* 末尾にエンキューする */
    public void PushLast(int num) {
        Push(num, false);
    }

    /* デキュー操作 */
    int? Pop(bool isFront) {
        if (IsEmpty())
            throw new Exception();
        int? val;
        // キューの長さが 1 のとき、先頭と末尾は同じノードを指す
        if (queSize == 1) {
            val = front!.val;
            front = null;
            rear = null;
        }
        // 先頭からのデキュー操作
        else if (isFront) {
            val = front!.val; // 先頭ノードの値を一時保存する
            // 先頭ノードを削除する
            ListNode? fNext = front?.next;
            fNext!.prev = null;
            front.next = null;
            front = fNext;   // 先頭ノードを更新する
        }
        // 末尾からのデキュー操作
        else {
            val = rear!.val;  // 末尾ノードの値を一時保存する
            // 末尾ノードを削除する
            ListNode? rPrev = rear?.prev;
            rPrev!.next = null;
            rear.prev = null;
            rear = rPrev;    // 末尾ノードを更新する
        }

        queSize--; // キューの長さを更新する
        return val;
    }

    /* 先頭からデキューする */
    public int? PopFirst() {
        return Pop(true);
    }

    /* 末尾からデキューする */
    public int? PopLast() {
        return Pop(false);
    }

    /* キューの先頭要素にアクセス */
    public int? PeekFirst() {
        if (IsEmpty())
            throw new Exception();
        return front?.val;
    }

    /* キューの末尾要素にアクセスする */
    public int? PeekLast() {
        if (IsEmpty())
            throw new Exception();
        return rear?.val;
    }

    /* 表示用の配列を返す */
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
        /* 両端キューを初期化する */
        LinkedListDeque deque = new();
        deque.PushLast(3);
        deque.PushLast(2);
        deque.PushLast(5);
        Console.WriteLine("両端キュー deque = " + string.Join(" ", deque.ToArray()));

        /* 要素にアクセスする */
        int? peekFirst = deque.PeekFirst();
        Console.WriteLine("キューの先頭要素 peekFirst = " + peekFirst);
        int? peekLast = deque.PeekLast();
        Console.WriteLine("キューの末尾要素 peekLast = " + peekLast);

        /* 要素をエンキューする */
        deque.PushLast(4);
        Console.WriteLine("要素 4 を末尾にエンキューした後 deque = " + string.Join(" ", deque.ToArray()));
        deque.PushFirst(1);
        Console.WriteLine("要素 1 を先頭にエンキューした後 deque = " + string.Join(" ", deque.ToArray()));

        /* 要素をデキューする */
        int? popLast = deque.PopLast();
        Console.WriteLine("末尾からデキューした要素 = " + popLast + "、末尾からデキューした後 deque = " + string.Join(" ", deque.ToArray()));
        int? popFirst = deque.PopFirst();
        Console.WriteLine("先頭からデキューした要素 = " + popFirst + "、先頭からデキューした後 deque = " + string.Join(" ", deque.ToArray()));

        /* 両端キューの長さを取得する */
        int size = deque.Size();
        Console.WriteLine("両端キューの長さ size = " + size);

        /* 両端キューが空かどうかを判定する */
        bool isEmpty = deque.IsEmpty();
        Console.WriteLine("両端キューは空か = " + isEmpty);
    }
}
