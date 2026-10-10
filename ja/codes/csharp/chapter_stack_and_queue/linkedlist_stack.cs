/**
 * File: linkedlist_stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 連結リストベースのスタック */
class LinkedListStack {
    ListNode? stackPeek;  // 先頭ノードをスタックトップとする
    int stkSize = 0;   // スタックの長さ

    public LinkedListStack() {
        stackPeek = null;
    }

    /* スタックの長さを取得 */
    public int Size() {
        return stkSize;
    }

    /* スタックが空かどうかを判定 */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* プッシュ */
    public void Push(int num) {
        ListNode node = new(num) {
            next = stackPeek
        };
        stackPeek = node;
        stkSize++;
    }

    /* ポップ */
    public int Pop() {
        int num = Peek();
        stackPeek = stackPeek!.next;
        stkSize--;
        return num;
    }

    /* スタックトップの要素にアクセス */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return stackPeek!.val;
    }

    /* List を Array に変換して返す */
    public int[] ToArray() {
        if (stackPeek == null)
            return [];

        ListNode? node = stackPeek;
        int[] res = new int[Size()];
        for (int i = res.Length - 1; i >= 0; i--) {
            res[i] = node!.val;
            node = node.next;
        }
        return res;
    }
}

public class linkedlist_stack {
    [Test]
    public void Test() {
        /* スタックを初期化 */
        LinkedListStack stack = new();

        /* 要素をプッシュ */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        Console.WriteLine("スタック stack = " + string.Join(",", stack.ToArray()));

        /* スタックトップの要素にアクセス */
        int peek = stack.Peek();
        Console.WriteLine("スタックトップ要素 peek = " + peek);

        /* 要素をポップ */
        int pop = stack.Pop();
        Console.WriteLine("ポップした要素 pop = " + pop + "、ポップ後の stack = " + string.Join(",", stack.ToArray()));

        /* スタックの長さを取得 */
        int size = stack.Size();
        Console.WriteLine("スタックの長さ size = " + size);

        /* 空かどうかを判定 */
        bool isEmpty = stack.IsEmpty();
        Console.WriteLine("スタックが空かどうか = " + isEmpty);
    }
}
