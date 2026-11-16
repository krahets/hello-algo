/**
 * File: stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class stack {
    [Test]
    public void Test() {
        // [region]{init_stack}
        /* スタックを初期化する */
        Stack<int> stack = new();
        // [endregion]{init_stack}

        // [region]{push}
        /* 要素をプッシュする */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        // [endregion]{push}
        // stack.ToArray() が返す列は逆順であり、インデックス 0 がスタックの先頭になることに注意
        Console.WriteLine("スタック stack = " + string.Join(",", stack));

        // [region]{peek}
        /* スタックの先頭要素にアクセスする */
        int peek = stack.Peek();
        // [endregion]{peek}
        Console.WriteLine("スタックの先頭要素 peek = " + peek);

        // [region]{pop}
        /* 要素をポップする */
        int pop = stack.Pop();
        // [endregion]{pop}
        Console.WriteLine("ポップした要素 pop = " + pop + "、ポップ後 stack = " + string.Join(",", stack));

        // [region]{size}
        /* スタックの長さを取得する */
        int size = stack.Count;
        // [endregion]{size}
        Console.WriteLine("スタックの長さ size = " + size);

        // [region]{is_empty}
        /* 空かどうかを判定する */
        bool isEmpty = stack.Count == 0;
        // [endregion]{is_empty}
        Console.WriteLine("スタックは空か = " + isEmpty);
    }
}
