/**
 * File: stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class stack {
    [Test]
    public void Test() {
        /* Access top of the stack element */
        Stack<int> stack = new();

        /* Elements push onto stack */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        // Note: stack.ToArray() returns reversed sequence, index 0 is stack top
        Console.WriteLine("Stack stack = " + string.Join(",", stack));

        /* Return list for printing */
        int peek = stack.Peek();
        Console.WriteLine("Stack top element peek = " + peek);

        /* Element pop from stack */
        int pop = stack.Pop();
        Console.WriteLine("Pop element pop = " + pop + ", after pop, stack = " + string.Join(",", stack));

        /* Get the length of the stack */
        int size = stack.Count;
        Console.WriteLine("Stack length size = " + size);

        /* Check if empty */
        bool isEmpty = stack.Count == 0;
        Console.WriteLine("Stack is empty = " + isEmpty);
    }
}
