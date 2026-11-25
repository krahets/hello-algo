/**
 * File: linkedlist_queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 連結リストを使ったキュー */
class LinkedListQueue {
    ListNode? front, rear;  // front は先頭ノード、rear は末尾ノードを指す 
    int queSize = 0;

    public LinkedListQueue() {
        front = null;
        rear = null;
    }

    /* キューの要素数を取得する */
    public int Size() {
        return queSize;
    }

    /* キューが空かどうかを判定する */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* エンキューする */
    public void Push(int num) {
        // 値が num のノードを末尾ノードの後ろに追加する
        ListNode node = new(num);
        // キューが空なら、先頭と末尾の両方がこのノードを指すようにする
        if (front == null) {
            front = node;
            rear = node;
            // キューが空でなければ、このノードを末尾ノードの後ろにつなぐ
        } else if (rear != null) {
            rear.next = node;
            rear = node;
        }
        queSize++;
    }

    /* デキューする */
    public int Pop() {
        int num = Peek();
        // 先頭ノードを削除する
        front = front?.next;
        queSize--;
        return num;
    }

    /* キューの先頭要素を参照する */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return front!.val;
    }

    /* 連結リストを配列に変換して返す */
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
        /* キューを初期化する */
        LinkedListQueue queue = new();

        /* 要素をキューに追加する */
        queue.Push(1);
        queue.Push(3);
        queue.Push(2);
        queue.Push(5);
        queue.Push(4);
        Console.WriteLine("キュー queue = " + string.Join(",", queue.ToArray()));

        /* キューの先頭要素を参照する */
        int peek = queue.Peek();
        Console.WriteLine("先頭要素 peek = " + peek);

        /* キューから要素を取り出す */
        int pop = queue.Pop();
        Console.WriteLine("デキューした要素 pop = " + pop + "、デキュー後の queue = " + string.Join(",", queue.ToArray()));

        /* キューの要素数を取得する */
        int size = queue.Size();
        Console.WriteLine("キューの要素数 size = " + size);

        /* キューが空かどうかを判定する */
        bool isEmpty = queue.IsEmpty();
        Console.WriteLine("キューは空か = " + isEmpty);
    }
}
