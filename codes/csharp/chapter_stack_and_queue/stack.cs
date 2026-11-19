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
        /* 初始化栈 */
        Stack<int> stack = new();
        // [endregion]{init_stack}

        // [region]{push}
        /* 元素入栈 */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        // [endregion]{push}
        // 请注意，stack.ToArray() 得到的是倒序序列，即索引 0 为栈顶
        Console.WriteLine("栈 stack = " + string.Join(",", stack));

        // [region]{peek}
        /* 访问栈顶元素 */
        int peek = stack.Peek();
        // [endregion]{peek}
        Console.WriteLine("栈顶元素 peek = " + peek);

        // [region]{pop}
        /* 元素出栈 */
        int pop = stack.Pop();
        // [endregion]{pop}
        Console.WriteLine("出栈元素 pop = " + pop + "，出栈后 stack = " + string.Join(",", stack));

        // [region]{size}
        /* 获取栈的长度 */
        int size = stack.Count;
        // [endregion]{size}
        Console.WriteLine("栈的长度 size = " + size);

        // [region]{is_empty}
        /* 判断是否为空 */
        bool isEmpty = stack.Count == 0;
        // [endregion]{is_empty}
        Console.WriteLine("栈是否为空 = " + isEmpty);
    }
}
