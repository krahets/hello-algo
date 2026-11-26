/**
 * File: linkedlist_deque.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 双方向連結リストのノード */
public class ListNode(int val) {
    public int val = val;       // ノードの値
    public ListNode? next = null; // 次のノードへの参照
    public ListNode? prev = null; // 前のノードへの参照
}

/* 双方向連結リストを使った両端キュー */
public class LinkedListDeque {
    ListNode? front, rear; // front は先頭ノード、rear は末尾ノードを指す
    int queSize = 0;      // 両端キューの要素数

    public LinkedListDeque() {
        front = null;
        rear = null;
    }

    /* 両端キューの要素数を取得する */
    public int Size() {
        return queSize;
    }

    /* 両端キューが空かどうかを判定する */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* 両端キューに要素を追加する */
    void Push(int num, bool isFront) {
        ListNode node = new(num);
        // リストが空なら、front と rear の両方が node を指すようにする
        if (IsEmpty()) {
            front = node;
            rear = node;
        }
        // 先頭に追加する
        else if (isFront) {
            // node をリストの先頭に追加する
            front!.prev = node;
            node.next = front;
            front = node; // 先頭ノードを更新する                           
        }
        // 末尾に追加する
        else {
            // node をリストの末尾に追加する
            rear!.next = node;
            node.prev = rear;
            rear = node;  // 末尾ノードを更新する
        }

        queSize++; // 両端キューの要素数を更新する
    }

    /* 先頭に追加する */
    public void PushFirst(int num) {
        Push(num, true);
    }

    /* 末尾に追加する */
    public void PushLast(int num) {
        Push(num, false);
    }

    /* 両端キューから要素を取り出す */
    int? Pop(bool isFront) {
        if (IsEmpty())
            throw new Exception();
        int? val;
        // 両端キューの要素数が 1 のとき、先頭と末尾は同じノードを指す
        if (queSize == 1) {
            val = front!.val;
            front = null;
            rear = null;
        }
        // 先頭から取り出す
        else if (isFront) {
            val = front!.val; // 先頭ノードの値を一時的に保存する
            // 先頭ノードを削除する
            ListNode? fNext = front?.next;
            fNext!.prev = null;
            front.next = null;
            front = fNext;   // 先頭ノードを更新する
        }
        // 末尾から取り出す
        else {
            val = rear!.val;  // 末尾ノードの値を一時的に保存する
            // 末尾ノードを削除する
            ListNode? rPrev = rear?.prev;
            rPrev!.next = null;
            rear.prev = null;
            rear = rPrev;    // 末尾ノードを更新する
        }

        queSize--; // 両端キューの要素数を更新する
        return val;
    }

    /* 先頭から取り出す */
    public int? PopFirst() {
        return Pop(true);
    }

    /* 末尾から取り出す */
    public int? PopLast() {
        return Pop(false);
    }

    /* 両端キューの先頭要素を参照する */
    public int? PeekFirst() {
        if (IsEmpty())
            throw new Exception();
        return front?.val;
    }

    /* 両端キューの末尾要素を参照する */
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

        /* 要素を参照する */
        int? peekFirst = deque.PeekFirst();
        Console.WriteLine("先頭要素 peekFirst = " + peekFirst);
        int? peekLast = deque.PeekLast();
        Console.WriteLine("末尾要素 peekLast = " + peekLast);

        /* 要素を両端キューに追加する */
        deque.PushLast(4);
        Console.WriteLine("末尾に 4 を追加した後の deque = " + string.Join(" ", deque.ToArray()));
        deque.PushFirst(1);
        Console.WriteLine("先頭に 1 を追加した後の deque = " + string.Join(" ", deque.ToArray()));

        /* 両端キューから要素を取り出す */
        int? popLast = deque.PopLast();
        Console.WriteLine("末尾から取り出した要素 = " + popLast + "、末尾から取り出した後の deque = " + string.Join(" ", deque.ToArray()));
        int? popFirst = deque.PopFirst();
        Console.WriteLine("先頭から取り出した要素 = " + popFirst + "、先頭から取り出した後の deque = " + string.Join(" ", deque.ToArray()));

        /* 両端キューの要素数を取得する */
        int size = deque.Size();
        Console.WriteLine("両端キューの要素数 size = " + size);

        /* 両端キューが空かどうかを判定する */
        bool isEmpty = deque.IsEmpty();
        Console.WriteLine("両端キューは空か = " + isEmpty);
    }
}
