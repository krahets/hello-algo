/**
 * File: linkedlist_stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Stack implemented with a linked list */
class LinkedListStack {
    ListNode? stackPeek;  // Use the head node as the stack top
    int stkSize = 0;   // Stack size

    public LinkedListStack() {
        stackPeek = null;
    }

    /* Get the stack size */
    public int Size() {
        return stkSize;
    }

    /* Check whether the stack is empty */
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

    /* Access the top element */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return stackPeek!.val;
    }

    /* Convert the linked list to an array and return it */
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
        /* Initialize the stack */
        LinkedListStack stack = new();

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
