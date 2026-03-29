/**
 * File: linkedlist_queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 連結リストベースのキュー */
class LinkedListQueue {
    ListNode? front, rear;  // 先頭ノード front、末尾ノード rear
    int queSize = 0;

    public LinkedListQueue() {
        front = null;
        rear = null;
    }

    /* キューの長さを取得 */
    public int Size() {
        return queSize;
    }

    /* キューが空かどうかを判定 */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* エンキュー */
    public void Push(int num) {
        // 末尾ノードの後ろに num を追加
        ListNode node = new(num);
        // キューが空なら、先頭・末尾ノードをともにそのノードに設定
        if (front == null) {
            front = node;
            rear = node;
            // キューが空でなければ、そのノードを末尾ノードの後ろに追加
        } else if (rear != null) {
            rear.next = node;
            rear = node;
        }
        queSize++;
    }

    /* デキュー */
    public int Pop() {
        int num = Peek();
        // 先頭ノードを削除
        front = front?.next;
        queSize--;
        return num;
    }

    /* キュー先頭の要素にアクセス */
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
        /* キューを初期化 */
        LinkedListQueue queue = new();

        /* 要素をエンキュー */
        queue.Push(1);
        queue.Push(3);
        queue.Push(2);
        queue.Push(5);
        queue.Push(4);
        Console.WriteLine("キュー queue = " + string.Join(",", queue.ToArray()));

        /* キュー先頭の要素にアクセス */
        int peek = queue.Peek();
        Console.WriteLine("先頭要素 peek = " + peek);

        /* 要素をデキュー */
        int pop = queue.Pop();
        Console.WriteLine("デキューした要素 pop = " + pop + "、デキュー後の queue = " + string.Join(",", queue.ToArray()));

        /* キューの長さを取得 */
        int size = queue.Size();
        Console.WriteLine("キューの長さ size = " + size);

        /* キューが空かどうかを判定 */
        bool isEmpty = queue.IsEmpty();
        Console.WriteLine("キューが空かどうか = " + isEmpty);
    }
}
