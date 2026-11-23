/**
 * File: linkedlist_queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Queue implemented with a linked list */
class LinkedListQueue {
    ListNode? front, rear;  // Head node front and tail node rear 
    int queSize = 0;

    public LinkedListQueue() {
        front = null;
        rear = null;
    }

    /* Get the queue size */
    public int Size() {
        return queSize;
    }

    /* Check whether the queue is empty */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* Enqueue */
    public void Push(int num) {
        // Add num after the tail node
        ListNode node = new(num);
        // If the queue is empty, make both the head and tail point to this node
        if (front == null) {
            front = node;
            rear = node;
            // If the queue is not empty, add this node after the tail node
        } else if (rear != null) {
            rear.next = node;
            rear = node;
        }
        queSize++;
    }

    /* Dequeue */
    public int Pop() {
        int num = Peek();
        // Remove the head node
        front = front?.next;
        queSize--;
        return num;
    }

    /* Access the front element */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return front!.val;
    }

    /* Convert the linked list to an array and return it */
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
        /* Initialize the queue */
        LinkedListQueue queue = new();

        /* Enqueue elements */
        queue.Push(1);
        queue.Push(3);
        queue.Push(2);
        queue.Push(5);
        queue.Push(4);
        Console.WriteLine("Queue queue = " + string.Join(",", queue.ToArray()));

        /* Access the front element */
        int peek = queue.Peek();
        Console.WriteLine("Front element peek = " + peek);

        /* Dequeue an element */
        int pop = queue.Pop();
        Console.WriteLine("Dequeued element pop = " + pop + ", after dequeuing, queue = " + string.Join(",", queue.ToArray()));

        /* Get the queue size */
        int size = queue.Size();
        Console.WriteLine("Queue size = " + size);

        /* Check whether the queue is empty */
        bool isEmpty = queue.IsEmpty();
        Console.WriteLine("Is the queue empty = " + isEmpty);
    }
}
