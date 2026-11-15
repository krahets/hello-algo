/**
 * File: stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class stack {
    [Test]
    public void Test() {
        /* 初始化堆疊 */
        Stack<int> stack = new();

        /* 元素入堆疊 */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        // 請注意，stack.ToArray() 得到的是倒序序列，即索引 0 為堆疊頂
        Console.WriteLine("堆疊 stack = " + string.Join(",", stack));

        /* 訪問堆疊頂元素 */
        int peek = stack.Peek();
        Console.WriteLine("堆疊頂元素 peek = " + peek);

        /* 元素出堆疊 */
        int pop = stack.Pop();
        Console.WriteLine("出堆疊元素 pop = " + pop + "，出堆疊後 stack = " + string.Join(",", stack));

        /* 獲取堆疊的長度 */
        int size = stack.Count;
        Console.WriteLine("堆疊的長度 size = " + size);

        /* 判斷是否為空 */
        bool isEmpty = stack.Count == 0;
        Console.WriteLine("堆疊是否為空 = " + isEmpty);
    }
}
