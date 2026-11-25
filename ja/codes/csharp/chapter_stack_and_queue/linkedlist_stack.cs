/**
 * File: linkedlist_stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* 連結リストを使ったスタック */
class LinkedListStack {
    ListNode? stackPeek;  // 先頭ノードをスタックのトップとする
    int stkSize = 0;   // スタックの要素数

    public LinkedListStack() {
        stackPeek = null;
    }

    /* スタックの要素数を取得する */
    public int Size() {
        return stkSize;
    }

    /* スタックが空かどうかを判定する */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* プッシュする */
    public void Push(int num) {
        ListNode node = new(num) {
            next = stackPeek
        };
        stackPeek = node;
        stkSize++;
    }

    /* ポップする */
    public int Pop() {
        int num = Peek();
        stackPeek = stackPeek!.next;
        stkSize--;
        return num;
    }

    /* スタックのトップを参照する */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return stackPeek!.val;
    }

    /* 連結リストを配列に変換して返す */
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
        /* スタックを初期化する */
        LinkedListStack stack = new();

        /* 要素をプッシュする */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        Console.WriteLine("スタック stack = " + string.Join(",", stack.ToArray()));

        /* スタックのトップを参照する */
        int peek = stack.Peek();
        Console.WriteLine("スタックのトップの要素 peek = " + peek);

        /* 要素をポップする */
        int pop = stack.Pop();
        Console.WriteLine("ポップした要素 pop = " + pop + "、ポップ後の stack = " + string.Join(",", stack.ToArray()));

        /* スタックの要素数を取得する */
        int size = stack.Size();
        Console.WriteLine("スタックの要素数 size = " + size);

        /* 空かどうかを判定する */
        bool isEmpty = stack.IsEmpty();
        Console.WriteLine("スタックは空か = " + isEmpty);
    }
}
