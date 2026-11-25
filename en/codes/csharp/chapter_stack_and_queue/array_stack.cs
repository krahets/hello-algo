/**
 * File: array_stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Array-backed stack */
class ArrayStack {
    List<int> stack;
    public ArrayStack() {
        // Initialize the list (a dynamic array)
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

    /* Push an element onto the stack */
    public void Push(int num) {
        stack.Add(num);
    }

    /* Remove and return the top element */
    public int Pop() {
        if (IsEmpty())
            throw new Exception();
        var val = Peek();
        stack.RemoveAt(Size() - 1);
        return val;
    }

    /* Peek at the top element */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return stack[Size() - 1];
    }

    /* Return the list elements as an array */
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
        Console.WriteLine("stack = " + string.Join(",", stack.ToArray()));

        /* Peek at the top element */
        int peek = stack.Peek();
        Console.WriteLine("Top element (peek) = " + peek);

        /* Pop the top element */
        int pop = stack.Pop();
        Console.WriteLine("Popped element (pop) = " + pop + ", stack after the pop = " + string.Join(",", stack.ToArray()));

        /* Get the stack size */
        int size = stack.Size();
        Console.WriteLine("Stack size = " + size);

        /* Check whether the stack is empty */
        bool isEmpty = stack.IsEmpty();
        Console.WriteLine("Stack is empty = " + isEmpty);
    }
}
