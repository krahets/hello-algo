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
        // stack.ToArray() が返す列は逆順であり、インデックス 0 がスタックの先頭になることに注意
        Console.WriteLine("スタック stack = " + string.Join(",", stack));

        /* スタックの先頭要素にアクセスする */
        int peek = stack.Peek();
        Console.WriteLine("スタックの先頭要素 peek = " + peek);

        /* 要素をポップする */
        int pop = stack.Pop();
        Console.WriteLine("ポップした要素 pop = " + pop + "、ポップ後 stack = " + string.Join(",", stack));

        /* スタックの長さを取得する */
        int size = stack.Count;
        Console.WriteLine("スタックの長さ size = " + size);

        /* 空かどうかを判定する */
        bool isEmpty = stack.Count == 0;
        Console.WriteLine("スタックは空か = " + isEmpty);
    }
}
