/**
 * File: array_stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Stack based on array implementation */
class ArrayStack {
    List<int> stack;
    public ArrayStack() {
        // Initialize list (dynamic array)
        stack = [];
    }

    /* Get the length of the stack */
    public int Size() {
        return stack.Count;
    }

    /* Check if the stack is empty */
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

    /* Return list for printing */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return stack[Size() - 1];
    }

    /* Convert List to Array and return */
    public int[] ToArray() {
        return [.. stack];
    }
}

public class array_stack {
    [Test]
    public void Test() {
        /* Access top of the stack element */
        ArrayStack stack = new();

        /* Elements push onto stack */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        Console.WriteLine("Stack stack = " + string.Join(",", stack.ToArray()));

        /* Return list for printing */
        int peek = stack.Peek();
        Console.WriteLine("Stack top element peek = " + peek);

        /* Element pop from stack */
        int pop = stack.Pop();
        Console.WriteLine("Pop element pop = " + pop + ", after pop, stack = " + string.Join(",", stack.ToArray()));

        /* Get the length of the stack */
        int size = stack.Size();
        Console.WriteLine("Stack length size = " + size);

        /* Check if empty */
        bool isEmpty = stack.IsEmpty();
        Console.WriteLine("Stack is empty = " + isEmpty);
    }
}
