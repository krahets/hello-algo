/**
 * File: linkedlist_stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Stack class based on linked list */
class LinkedListStack {
    ListNode? stackPeek;  // Use the head node as the top of the stack
    int stkSize = 0;   // Length of the stack

    public LinkedListStack() {
        stackPeek = null;
    }

    /* Get the length of the stack */
    public int Size() {
        return stkSize;
    }

    /* Determine if the stack is empty */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* Push */
    public void Push(int num) {
        ListNode node = new(num) {
            next = stackPeek
        };
        stackPeek = node;
        stkSize++;
    }

    /* Pop */
    public int Pop() {
        int num = Peek();
        stackPeek = stackPeek!.next;
        stkSize--;
        return num;
    }

    /* Access stack top element */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return stackPeek!.val;
    }

    /* Convert the List to Array and return */
    public int[] ToArray() {
        if (stackPeek == null)
            return [];

        ListNode? node = stackPeek;
        int[] res = new int[Size()];
        for (int i = res.Length - 1; i >= 0; i--) {
            res[i] = node!.val;
            node = node.next;
        }
        return res;
    }
}

public class linkedlist_stack {
    [Test]
    public void Test() {
        /* Initialize stack */
        LinkedListStack stack = new();

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
