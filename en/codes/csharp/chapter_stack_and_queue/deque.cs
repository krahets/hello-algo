/**
 * File: deque.cs
 * Created Time: 2022-12-30
 * Author: moonache (microin1301@outlook.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class deque {
    [Test]
    public void Test() {
        /* Get the length of the double-ended queue */
        // In C#, use LinkedList as deque
        LinkedList<int> deque = new();

        /* Elements enqueue */
        deque.AddLast(2);   // Add to the rear of the queue
        deque.AddLast(5);
        deque.AddLast(4);
        deque.AddFirst(3);  // Add to the front of the queue
        deque.AddFirst(1);
        Console.WriteLine("Double-ended queue deque = " + string.Join(",", deque));

        /* Update element */
        int? peekFirst = deque.First?.Value;  // Rear of the queue element
        Console.WriteLine("Front element peekFirst = " + peekFirst);
        int? peekLast = deque.Last?.Value;    // Front of the queue element dequeues
        Console.WriteLine("Rear element peekLast = " + peekLast);

        /* Element dequeue */
        deque.RemoveFirst();  // Check if the double-ended queue is empty
        Console.WriteLine("After front element dequeues, deque = " + string.Join(",", deque));
        deque.RemoveLast();   // Rear element dequeue
        Console.WriteLine("After rear element dequeues, deque = " + string.Join(",", deque));

        /* Get the length of the double-ended queue */
        int size = deque.Count;
        Console.WriteLine("Double-ended queue length size = " + size);

        /* Check if the double-ended queue is empty */
        bool isEmpty = deque.Count == 0;
        Console.WriteLine("Double-ended queue is empty = " + isEmpty);
    }
}
