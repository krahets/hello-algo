/**
 * File: array_stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Stack class based on array */
class ArrayStack {
    List<int> stack;
    public ArrayStack() {
        // Initialize the list (dynamic array)
        stack = [];
    }

    /* Get the length of the stack */
    public int Size() {
        return stack.Count;
    }

    /* Determine if the stack is empty */
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

    /* Access stack top element */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return stack[Size() - 1];
    }

    /* Convert the List to Array and return */
    public int[] ToArray() {
        return [.. stack];
    }
}

public class array_stack {
    [Test]
    public void Test() {
        /* Initialize stack */
        ArrayStack stack = new();

        /* Element push */
        stack.Push(1);
        stack.Push(3);
        stack.Push(2);
        stack.Push(5);
        stack.Push(4);
        Console.WriteLine("Stack = " + string.Join(", ", stack.ToArray()));

        /* Access stack top element */
        int peek = stack.Peek();
        Console.WriteLine("Top element peek =" + peek);

        /* Element pop */
        int pop = stack.Pop();
        Console.WriteLine("Element popped from the stack = " + pop + ", stack after popping = " + string.Join(", ", stack.ToArray()));

        /* Get the length of the stack */
        int size = stack.Size();
        Console.WriteLine("Length of the stack size =" + size);

        /* Determine if it's empty */
        bool isEmpty = stack.IsEmpty();
        Console.WriteLine("Is the stack empty =" + isEmpty);
    }
}
