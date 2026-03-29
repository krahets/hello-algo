/**
 * File: stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class stack {
    [Test]
    public void Test() {
        /* スタックを初期化 */
        Stack<int> stack = new();

        /* 要素をプッシュ */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        // 注意：stack.ToArray() で得られるのは逆順のシーケンスであり、インデックス 0 がスタックトップです
        Console.WriteLine("スタック stack = " + string.Join(",", stack));

        /* スタックトップの要素にアクセス */
        int peek = stack.Peek();
        Console.WriteLine("スタックトップ要素 peek = " + peek);

        /* 要素をポップ */
        int pop = stack.Pop();
        Console.WriteLine("ポップした要素 pop = " + pop + "、ポップ後の stack = " + string.Join(",", stack));

        /* スタックの長さを取得 */
        int size = stack.Count;
        Console.WriteLine("スタックの長さ size = " + size);

        /* 空かどうかを判定 */
        bool isEmpty = stack.Count == 0;
        Console.WriteLine("スタックが空かどうか = " + isEmpty);
    }
}
