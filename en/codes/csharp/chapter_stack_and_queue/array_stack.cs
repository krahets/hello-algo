/**
 * File: array_stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Stack implemented with an array */
class ArrayStack {
    List<int> stack;
    public ArrayStack() {
        // Initialize the list (dynamic array)
        stack = [];
    }

    /* Get the stack size */
    public int Size() {
        return stack.Count;
    }

    /* Check whether the stack is empty */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* Push */
    public void Push(int num) {
        stack.Add(num);
    }

    /* Pop */
    public int Pop() {
        if (IsEmpty())
            throw new Exception();
        var val = Peek();
        stack.RemoveAt(Size() - 1);
        return val;
    }

    /* Access the top element */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return stack[Size() - 1];
    }

    /* Convert the list to an array and return it */
    public int[] ToArray() {
        return [.. stack];
    }
}

public class array_stack {
    [Test]
    public void Test() {
        /* Initialize the stack */
        ArrayStack stack = new();

        /* Push elements onto the stack */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        Console.WriteLine("Stack stack = " + string.Join(",", stack.ToArray()));

        /* Access the top element */
        int peek = stack.Peek();
        Console.WriteLine("Top element peek = " + peek);

        /* Pop an element from the stack */
        int pop = stack.Pop();
        Console.WriteLine("Popped element pop = " + pop + ", after popping, stack = " + string.Join(",", stack.ToArray()));

        /* Get the stack size */
        int size = stack.Size();
        Console.WriteLine("Stack size = " + size);

        /* Check whether it is empty */
        bool isEmpty = stack.IsEmpty();
        Console.WriteLine("Is the stack empty = " + isEmpty);
    }
}
