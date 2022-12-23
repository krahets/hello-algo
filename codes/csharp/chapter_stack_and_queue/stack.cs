
using NUnit.Framework;
using System.Collections.Immutable;

namespace hello_algo.chapter_stack_and_queue
{
    public class stack
    {
        [Test]
        public void Test()
        {
            /* 初始化栈 */
            Stack<int> stack = new();

            /* 元素入栈 */
            stack.Push(1);
            stack.Push(3);
            stack.Push(2);
            stack.Push(5);
            stack.Push(4);
            Console.WriteLine("栈 stack = " + String.Join(",", stack.ToImmutableArray()));

            /* 访问栈顶元素 */
            int peek = stack.Peek();
            Console.WriteLine("栈顶元素 peek = " + peek);

            /* 元素出栈 */
            int pop = stack.Pop();
            Console.WriteLine("出栈元素 pop = " + pop + "，出栈后 stack = " + String.Join(",", stack.ToImmutableArray()));

            /* 获取栈的长度 */
            int size = stack.Count();
            Console.WriteLine("栈的长度 size = " + size);

            /* 判断是否为空 */
            bool isEmpty = stack.Count() == 0;
            Console.WriteLine("栈是否为空 = " + isEmpty);
        }
    }
}