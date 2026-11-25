/**
 * File: linkedlist_queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Queue backed by a linked list */
class LinkedListQueue {
    ListNode? front, rear;  // front points to the head node and rear to the tail node 
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

    /* Enqueue an element */
    public void Push(int num) {
        // Add a node containing num after the tail
        ListNode node = new(num);
        // If the queue is empty, point both the head and tail at the new node
        if (front == null) {
            front = node;
            rear = node;
            // If the queue has elements, link the new node after the tail
        } else if (rear != null) {
            rear.next = node;
            rear = node;
        }
        queSize++;
    }

    /* Remove and return the front element */
    public int Pop() {
        int num = Peek();
        // Remove the head node
        front = front?.next;
        queSize--;
        return num;
    }

    /* Peek at the front element */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return front!.val;
    }

    /* Return the linked list elements as an array */
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
        Console.WriteLine("queue = " + string.Join(",", queue.ToArray()));

        /* Peek at the front element */
        int peek = queue.Peek();
        Console.WriteLine("Front element (peek) = " + peek);

        /* Dequeue an element */
        int pop = queue.Pop();
        Console.WriteLine("Dequeued element (pop) = " + pop + ", queue after removal = " + string.Join(",", queue.ToArray()));

        /* Get the queue size */
        int size = queue.Size();
        Console.WriteLine("Queue size = " + size);

        /* Check whether the queue is empty */
        bool isEmpty = queue.IsEmpty();
        Console.WriteLine("Queue is empty = " + isEmpty);
    }
}
