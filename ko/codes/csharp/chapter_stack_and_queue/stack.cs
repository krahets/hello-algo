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
        /* 스택 초기화 */
        Stack<int> stack = new();
        // [endregion]{init_stack}

        // [region]{push}
        /* 스택에 원소 삽입 */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        // [endregion]{push}
        // stack.ToArray()는 역순 수열을 반환하며, 인덱스 0이 스택의 맨 위이다
        Console.WriteLine("스택 stack = " + string.Join(",", stack));

        // [region]{peek}
        /* 스택 맨 위 원소 접근 */
        int peek = stack.Peek();
        // [endregion]{peek}
        Console.WriteLine("스택 맨 위 원소 peek = " + peek);

        // [region]{pop}
        /* 스택에서 원소 꺼내기 */
        int pop = stack.Pop();
        // [endregion]{pop}
        Console.WriteLine("스택에서 꺼낸 원소 pop = " + pop + ", 스택에서 꺼낸 후 stack = " + string.Join(",", stack));

        // [region]{size}
        /* 스택의 길이 반환 */
        int size = stack.Count;
        // [endregion]{size}
        Console.WriteLine("스택의 길이 size = " + size);

        // [region]{is_empty}
        /* 비어 있는지 판단 */
        bool isEmpty = stack.Count == 0;
        // [endregion]{is_empty}
        Console.WriteLine("스택이 비어 있는가 = " + isEmpty);
    }
}
