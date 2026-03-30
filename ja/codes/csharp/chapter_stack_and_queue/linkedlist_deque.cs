/**
 * File: linkedlist_deque.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 双方向連結リストノード */
public class ListNode(int val) {
    public int val = val;       // ノード値
    public ListNode? next = null; // 後続ノードへの参照
    public ListNode? prev = null; // 前駆ノードへの参照
}

/* 双方向連結リストベースの両端キュー */
public class LinkedListDeque {
    ListNode? front, rear; // 先頭ノード front、末尾ノード rear
    int queSize = 0;      // 両端キューの長さ

    public LinkedListDeque() {
        front = null;
        rear = null;
    }

    /* 両端キューの長さを取得 */
    public int Size() {
        return queSize;
    }

    /* 両端キューが空かどうかを判定 */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* エンキュー操作 */
    void Push(int num, bool isFront) {
        ListNode node = new(num);
        // 連結リストが空なら、front と rear の両方を node に向ける
        if (IsEmpty()) {
            front = node;
            rear = node;
        }
        // 先頭へのエンキュー操作
        else if (isFront) {
            // node を連結リストの先頭に追加
            front!.prev = node;
            node.next = front;
            front = node; // 先頭ノードを更新する
        }
        // 末尾へのエンキュー操作
        else {
            // node を連結リストの末尾に追加
            rear!.next = node;
            node.prev = rear;
            rear = node;  // 末尾ノードを更新する
        }

        queSize++; // キューの長さを更新
    }

    /* キュー先頭にエンキュー */
    public void PushFirst(int num) {
        Push(num, true);
    }

    /* キュー末尾にエンキュー */
    public void PushLast(int num) {
        Push(num, false);
    }

    /* デキュー操作 */
    int? Pop(bool isFront) {
        if (IsEmpty())
            throw new Exception();
        int? val;
        // キュー先頭からの取り出し
        if (isFront) {
            val = front?.val; // 先頭ノードの値を一時保存
            // 先頭ノードを削除
            ListNode? fNext = front?.next;
            if (fNext != null) {
                fNext.prev = null;
                front!.next = null;
            }
            front = fNext;   // 先頭ノードを更新する
        }
        // キュー末尾からの取り出し
        else {
            val = rear?.val;  // 末尾ノードの値を一時保存
            // 末尾ノードを削除
            ListNode? rPrev = rear?.prev;
            if (rPrev != null) {
                rPrev.next = null;
                rear!.prev = null;
            }
            rear = rPrev;    // 末尾ノードを更新する
        }

        queSize--; // キューの長さを更新
        return val;
    }

    /* キュー先頭からデキュー */
    public int? PopFirst() {
        return Pop(true);
    }

    /* キュー末尾からデキュー */
    public int? PopLast() {
        return Pop(false);
    }

    /* キュー先頭の要素にアクセス */
    public int? PeekFirst() {
        if (IsEmpty())
            throw new Exception();
        return front?.val;
    }

    /* キュー末尾の要素にアクセス */
    public int? PeekLast() {
        if (IsEmpty())
            throw new Exception();
        return rear?.val;
    }

    /* 出力用の配列を返す */
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
        /* 両端キューを初期化 */
        LinkedListDeque deque = new();
        deque.PushLast(3);
        deque.PushLast(2);
        deque.PushLast(5);
        Console.WriteLine("双方向キュー deque = " + string.Join(" ", deque.ToArray()));

        /* 要素にアクセス */
        int? peekFirst = deque.PeekFirst();
        Console.WriteLine("先頭要素 peekFirst = " + peekFirst);
        int? peekLast = deque.PeekLast();
        Console.WriteLine("末尾要素 peekLast = " + peekLast);

        /* 要素をエンキュー */
        deque.PushLast(4);
        Console.WriteLine("要素 4 を末尾にエンキューした後 deque = " + string.Join(" ", deque.ToArray()));
        deque.PushFirst(1);
        Console.WriteLine("要素 1 を先頭にエンキューした後 deque = " + string.Join(" ", deque.ToArray()));

        /* 要素をデキュー */
        int? popLast = deque.PopLast();
        Console.WriteLine("末尾からデキューした要素 = " + popLast + "、末尾からデキューした後 deque = " + string.Join(" ", deque.ToArray()));
        int? popFirst = deque.PopFirst();
        Console.WriteLine("先頭からデキューした要素 = " + popFirst + "、先頭からデキューした後 deque = " + string.Join(" ", deque.ToArray()));

        /* 両端キューの長さを取得 */
        int size = deque.Size();
        Console.WriteLine("双方向キューの長さ size = " + size);

        /* 両端キューが空かどうかを判定 */
        bool isEmpty = deque.IsEmpty();
        Console.WriteLine("双方向キューが空かどうか = " + isEmpty);
    }
}
