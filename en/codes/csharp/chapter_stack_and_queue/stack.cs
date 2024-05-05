/**
 * File: stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class stack {
    [Test]
    public void Test() {
        /* Initialize stack */
        Stack<int> stack = new();

        /* Element push */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        // Note that stack.ToArray() results in a reverse sequence, with index 0 as the top of the stack
        Console.WriteLine("Stack = " + string.Join(", ", stack));

        /* Access stack top element */
        int peek = stack.Peek();
        Console.WriteLine("Top element peek =" + peek);

        /* Element pop */
        int pop = stack.Pop();
        Console.WriteLine("Element popped from the stack = " + pop + ", stack after popping = " + string.Join(", ", stack));

        /* Get the length of the stack */
        int size = stack.Count;
        Console.WriteLine("Length of the stack size =" + size);

        /* Determine if it's empty */
        bool isEmpty = stack.Count == 0;
        Console.WriteLine("Is the stack empty =" + isEmpty);
    }
}
