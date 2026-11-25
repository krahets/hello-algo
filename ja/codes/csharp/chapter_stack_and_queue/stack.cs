/**
 * File: stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class stack {
    [Test]
    public void Test() {
        /* スタックを初期化する */
        Stack<int> stack = new();

        /* 要素をプッシュする */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        // stack.ToArray() では要素が逆順に並び、インデックス 0 がスタックのトップになる点に注意
        Console.WriteLine("スタック stack = " + string.Join(",", stack));

        /* スタックのトップを参照する */
        int peek = stack.Peek();
        Console.WriteLine("スタックのトップの要素 peek = " + peek);

        /* 要素をポップする */
        int pop = stack.Pop();
        Console.WriteLine("ポップした要素 pop = " + pop + "、ポップ後の stack = " + string.Join(",", stack));

        /* スタックの要素数を取得する */
        int size = stack.Count;
        Console.WriteLine("スタックの要素数 size = " + size);

        /* 空かどうかを判定する */
        bool isEmpty = stack.Count == 0;
        Console.WriteLine("スタックは空か = " + isEmpty);
    }
}
