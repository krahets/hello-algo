/**
 * File: stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class stack {
    [Test]
    public void Test() {
        /* 스택 초기화 */
        Stack<int> stack = new();

        /* 스택에 원소 삽입 */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        // stack.ToArray()를 호출하면 원소가 삽입 순서의 역순으로 반환되므로 인덱스 0에 스택의 맨 위 원소가 있다
        Console.WriteLine("스택 stack = " + string.Join(",", stack));

        /* 스택 맨 위의 원소 조회 */
        int peek = stack.Peek();
        Console.WriteLine("맨 위 원소 peek = " + peek);

        /* 스택에서 원소 꺼내기 */
        int pop = stack.Pop();
        Console.WriteLine("꺼낸 원소 pop = " + pop + ", 꺼낸 후 stack = " + string.Join(",", stack));

        /* 스택의 길이 조회 */
        int size = stack.Count;
        Console.WriteLine("스택의 길이 size = " + size);

        /* 비어 있는지 확인 */
        bool isEmpty = stack.Count == 0;
        Console.WriteLine("스택이 비어 있는가 = " + isEmpty);
    }
}
