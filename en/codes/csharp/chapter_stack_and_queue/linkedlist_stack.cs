/**
 * File: linkedlist_stack.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Stack based on linked list implementation */
class LinkedListStack {
    ListNode? stackPeek;  // Use head node as stack top
    int stkSize = 0;   // Stack length

    public LinkedListStack() {
        stackPeek = null;
    }

    /* Get the length of the stack */
    public int Size() {
        return stkSize;
    }

    /* Check if the stack is empty */
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

    /* Return list for printing */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return stackPeek!.val;
    }

    /* Convert List to Array and return */
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
        /* Access top of the stack element */
        LinkedListStack stack = new();

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
