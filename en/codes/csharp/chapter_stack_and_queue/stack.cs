/**
 * File: stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class stack {
    [Test]
    public void Test() {
        /* Initialize the stack */
        Stack<int> stack = new();

        /* Push elements onto the stack */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        // stack.ToArray() returns the elements in reverse order, with the top of the stack at index 0
        Console.WriteLine("stack = " + string.Join(",", stack));

        /* Peek at the top element */
        int peek = stack.Peek();
        Console.WriteLine("Top element (peek) = " + peek);

        /* Pop the top element */
        int pop = stack.Pop();
        Console.WriteLine("Popped element (pop) = " + pop + ", stack after the pop = " + string.Join(",", stack));

        /* Get the stack size */
        int size = stack.Count;
        Console.WriteLine("Stack size = " + size);

        /* Check whether the stack is empty */
        bool isEmpty = stack.Count == 0;
        Console.WriteLine("Stack is empty = " + isEmpty);
    }
}
