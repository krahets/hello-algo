/**
 * File: linkedlist_queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 連結リストで実装したキュー */
class LinkedListQueue {
    ListNode? front, rear;  // 先頭ノード front 、末尾ノード rear 
    int queSize = 0;

    public LinkedListQueue() {
        front = null;
        rear = null;
    }

    /* キューの長さを取得 */
    public int Size() {
        return queSize;
    }

    /* キューが空か判定 */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* エンキュー */
    public void Push(int num) {
        // 末尾ノードの後ろに num を追加する
        ListNode node = new(num);
        // キューが空の場合、先頭と末尾の両方がこのノードを指すようにする
        if (front == null) {
            front = node;
            rear = node;
            // キューが空でない場合、このノードを末尾ノードの後ろに追加する
        } else if (rear != null) {
            rear.next = node;
            rear = node;
        }
        queSize++;
    }

    /* デキュー */
    public int Pop() {
        int num = Peek();
        // 先頭ノードを削除する
        front = front?.next;
        queSize--;
        return num;
    }

    /* キューの先頭要素にアクセス */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return front!.val;
    }

    /* 連結リストを Array に変換して返す */
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

        /* 要素をエンキューする */
        queue.Push(1);
        queue.Push(3);
        queue.Push(2);
        queue.Push(5);
        queue.Push(4);
        Console.WriteLine("キュー queue = " + string.Join(",", queue.ToArray()));

        /* キューの先頭要素にアクセス */
        int peek = queue.Peek();
        Console.WriteLine("キューの先頭要素 peek = " + peek);

        /* 要素をデキューする */
        int pop = queue.Pop();
        Console.WriteLine("デキューした要素 pop = " + pop + "、デキュー後 queue = " + string.Join(",", queue.ToArray()));

        /* キューの長さを取得 */
        int size = queue.Size();
        Console.WriteLine("キューの長さ size = " + size);

        /* キューが空か判定 */
        bool isEmpty = queue.IsEmpty();
        Console.WriteLine("キューは空か = " + isEmpty);
    }
}
