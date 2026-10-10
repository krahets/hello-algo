/**
 * File: linkedlist_queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Queue based on linked list implementation */
class LinkedListQueue {
    ListNode? front, rear;  // Head node front, tail node rear
    int queSize = 0;

    public LinkedListQueue() {
        front = null;
        rear = null;
    }

    /* Get the length of the queue */
    public int Size() {
        return queSize;
    }

    /* Check if the queue is empty */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* Enqueue */
    public void Push(int num) {
        // Add num after the tail node
        ListNode node = new(num);
        // If the queue is empty, make both front and rear point to the node
        if (front == null) {
            front = node;
            rear = node;
            // If the queue is not empty, add the node after the tail node
        } else if (rear != null) {
            rear.next = node;
            rear = node;
        }
        queSize++;
    }

    /* Dequeue */
    public int Pop() {
        int num = Peek();
        // Delete head node
        front = front?.next;
        queSize--;
        return num;
    }

    /* Return list for printing */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return front!.val;
    }

    /* Convert linked list to Array and return */
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
        /* Access front of the queue element */
        LinkedListQueue queue = new();

        /* Elements enqueue */
        queue.Push(1);
        queue.Push(3);
        queue.Push(2);
        queue.Push(5);
        queue.Push(4);
        Console.WriteLine("Queue queue = " + string.Join(",", queue.ToArray()));

        /* Return list for printing */
        int peek = queue.Peek();
        Console.WriteLine("Front element peek = " + peek);

        /* Element dequeue */
        int pop = queue.Pop();
        Console.WriteLine("Dequeue element pop = " + pop + ", after dequeue, queue = " + string.Join(",", queue.ToArray()));

        /* Get the length of the queue */
        int size = queue.Size();
        Console.WriteLine("Queue length size = " + size);

        /* Check if the queue is empty */
        bool isEmpty = queue.IsEmpty();
        Console.WriteLine("Queue is empty = " + isEmpty);
    }
}
