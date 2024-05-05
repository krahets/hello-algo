/**
 * File: linkedlist_queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Queue class based on linked list */
class LinkedListQueue {
    ListNode? front, rear;  // Front node front, rear node rear
    int queSize = 0;

    public LinkedListQueue() {
        front = null;
        rear = null;
    }

    /* Get the length of the queue */
    public int Size() {
        return queSize;
    }

    /* Determine if the queue is empty */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* Enqueue */
    public void Push(int num) {
        // Add num behind the tail node
        ListNode node = new(num);
        // If the queue is empty, make the head and tail nodes both point to that node
        if (front == null) {
            front = node;
            rear = node;
            // If the queue is not empty, add that node behind the tail node
        } else if (rear != null) {
            rear.next = node;
            rear = node;
        }
        queSize++;
    }

    /* Dequeue */
    public int Pop() {
        int num = Peek();
        // Remove head node
        front = front?.next;
        queSize--;
        return num;
    }

    /* Access front element */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return front!.val;
    }

    /* Convert the linked list to Array and return */
    public int[] ToArray() {
        if (front == null)
            return [];

        ListNode? node = front;
        int[] res = new int[Size()];
        for (int i = 0; i < res.Length; i++) {
            res[i] = node!.val;
            node = node.next;
        }
        return res;
    }
}

public class linkedlist_queue {
    [Test]
    public void Test() {
        /* Initialize queue */
        LinkedListQueue queue = new();

        /* Element enqueue */
        queue.Push(1);
        queue.Push(3);
        queue.Push(2);
        queue.Push(5);
        queue.Push(4);
        Console.WriteLine("Queue = " + string.Join(", ", queue.ToArray()));

        /* Access front element */
        int peek = queue.Peek();
        Console.WriteLine("Front element peek =" + peek);

        /* Element dequeue */
        int pop = queue.Pop();
        Console.WriteLine("Element popped from the queue = " + pop + ", queue after dequeuing = " + string.Join(", ", queue.ToArray()));

        /* Get the length of the queue */
        int size = queue.Size();
        Console.WriteLine("Length of the queue size =" + size);

        /* Determine if the queue is empty */
        bool isEmpty = queue.IsEmpty();
        Console.WriteLine("Is the queue empty =" + isEmpty);
    }
}
