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
        // Note that stack.ToArray() returns elements in reverse insertion order, with the stack top at index 0
        Console.WriteLine("Stack stack = " + string.Join(",", stack));

        /* Access the top element */
        int peek = stack.Peek();
        Console.WriteLine("Top element peek = " + peek);

        /* Pop an element from the stack */
        int pop = stack.Pop();
        Console.WriteLine("Popped element pop = " + pop + ", after popping, stack = " + string.Join(",", stack));

        /* Get the stack size */
        int size = stack.Count;
        Console.WriteLine("Stack size = " + size);

        /* Check whether it is empty */
        bool isEmpty = stack.Count == 0;
        Console.WriteLine("Is the stack empty = " + isEmpty);
    }
}
