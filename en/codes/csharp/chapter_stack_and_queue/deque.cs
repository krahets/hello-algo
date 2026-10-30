/**
 * File: deque.cs
 * Created Time: 2022-12-30
 * Author: moonache (microin1301@outlook.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class deque {
    [Test]
    public void Test() {
        /* Initialize the deque */
        // In C#, use LinkedList as a deque
        LinkedList<int> deque = new();

        /* Enqueue elements */
        deque.AddLast(2);   // Add to the rear
        deque.AddLast(5);
        deque.AddLast(4);
        deque.AddFirst(3);  // Add to the front
        deque.AddFirst(1);
        Console.WriteLine("Deque deque = " + string.Join(",", deque));

        /* Access an element */
        int? peekFirst = deque.First?.Value;  // Front element
        Console.WriteLine("Front element peekFirst = " + peekFirst);
        int? peekLast = deque.Last?.Value;    // Rear element
        Console.WriteLine("Rear element peekLast = " + peekLast);

        /* Dequeue an element */
        deque.RemoveFirst();  // Dequeue the front element
        Console.WriteLine("After dequeuing the front element, deque = " + string.Join(",", deque));
        deque.RemoveLast();   // Dequeue the rear element
        Console.WriteLine("After dequeuing the rear element, deque = " + string.Join(",", deque));

        /* Get the deque size */
        int size = deque.Count;
        Console.WriteLine("Deque size = " + size);

        /* Check whether the deque is empty */
        bool isEmpty = deque.Count == 0;
        Console.WriteLine("Is the deque empty = " + isEmpty);
    }
}
