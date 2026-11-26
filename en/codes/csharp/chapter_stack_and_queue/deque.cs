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
        // Use a LinkedList as a deque in C#
        LinkedList<int> deque = new();

        /* Add elements to the deque */
        deque.AddLast(2);   // Add at the rear
        deque.AddLast(5);
        deque.AddLast(4);
        deque.AddFirst(3);  // Add at the front
        deque.AddFirst(1);
        Console.WriteLine("deque = " + string.Join(",", deque));

        /* Peek at the front and rear elements */
        int? peekFirst = deque.First?.Value;  // Front element
        Console.WriteLine("Front element (peekFirst) = " + peekFirst);
        int? peekLast = deque.Last?.Value;    // Rear element
        Console.WriteLine("Rear element (peekLast) = " + peekLast);

        /* Remove elements from both ends */
        deque.RemoveFirst();  // Remove the front element
        Console.WriteLine("After removing the front element, deque = " + string.Join(",", deque));
        deque.RemoveLast();   // Remove the rear element
        Console.WriteLine("After removing the rear element, deque = " + string.Join(",", deque));

        /* Get the deque size */
        int size = deque.Count;
        Console.WriteLine("Deque size = " + size);

        /* Check whether the deque is empty */
        bool isEmpty = deque.Count == 0;
        Console.WriteLine("Deque is empty = " + isEmpty);
    }
}
