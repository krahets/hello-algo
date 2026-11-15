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
        /* Initialize the stack */
        Stack<int> stack = new();
        // [endregion]{init_stack}

        // [region]{push}
        /* Push elements onto the stack */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        // Note that stack.ToArray() returns elements in reverse insertion order, with the stack top at index 0
        // [endregion]{push}
        Console.WriteLine("Stack stack = " + string.Join(",", stack));

        // [region]{peek}
        /* Access the top element */
        int peek = stack.Peek();
        // [endregion]{peek}
        Console.WriteLine("Top element peek = " + peek);

        // [region]{pop}
        /* Pop an element from the stack */
        int pop = stack.Pop();
        // [endregion]{pop}
        Console.WriteLine("Popped element pop = " + pop + ", after popping, stack = " + string.Join(",", stack));

        // [region]{size}
        /* Get the stack size */
        int size = stack.Count;
        // [endregion]{size}
        Console.WriteLine("Stack size = " + size);

        // [region]{is_empty}
        /* Check whether it is empty */
        bool isEmpty = stack.Count == 0;
        // [endregion]{is_empty}
        Console.WriteLine("Is the stack empty = " + isEmpty);
    }
}
