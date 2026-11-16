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
        /* 初始化堆疊 */
        Stack<int> stack = new();
        // [endregion]{init_stack}

        // [region]{push}
        /* 元素入堆疊 */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        // [endregion]{push}
        // 請注意，stack.ToArray() 得到的是倒序序列，即索引 0 為堆疊頂
        Console.WriteLine("堆疊 stack = " + string.Join(",", stack));

        // [region]{peek}
        /* 訪問堆疊頂元素 */
        int peek = stack.Peek();
        // [endregion]{peek}
        Console.WriteLine("堆疊頂元素 peek = " + peek);

        // [region]{pop}
        /* 元素出堆疊 */
        int pop = stack.Pop();
        // [endregion]{pop}
        Console.WriteLine("出堆疊元素 pop = " + pop + "，出堆疊後 stack = " + string.Join(",", stack));

        // [region]{size}
        /* 獲取堆疊的長度 */
        int size = stack.Count;
        // [endregion]{size}
        Console.WriteLine("堆疊的長度 size = " + size);

        // [region]{is_empty}
        /* 判斷是否為空 */
        bool isEmpty = stack.Count == 0;
        // [endregion]{is_empty}
        Console.WriteLine("堆疊是否為空 = " + isEmpty);
    }
}
