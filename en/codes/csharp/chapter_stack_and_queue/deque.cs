/**
 * File: deque.cs
 * Created Time: 2022-12-30
 * Author: moonache (microin1301@outlook.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class deque {
    [Test]
    public void Test() {
        /* Initialize double-ended queue */
        // In C#, consider the LinkedList as a deque for use
        LinkedList<int> deque = new();

        /* Element enqueue */
        deque.AddLast(2);   // Add to rear
        deque.AddLast(5);
        deque.AddLast(4);
        deque.AddFirst(3);  // Add to front
        deque.AddFirst(1);
        Console.WriteLine("Deque = " + string.Join(", ", deque));

        /* Access element */
        int? peekFirst = deque.First?.Value;  // Front element
        Console.WriteLine("Front element peekFirst =" + peekFirst);
        int? peekLast = deque.Last?.Value;    // Rear element
        Console.WriteLine("Back element peekLast =" + peekLast);

        /* Element dequeue */
        deque.RemoveFirst();  // Front element dequeue
        Console.WriteLine("Front element of the deque after dequeuing = " + string.Join(", ", deque));
        deque.RemoveLast();   // Rear element dequeue
        Console.WriteLine("Rear element of the deque after dequeuing = " + string.Join(", ", deque));

        /* Get the length of the double-ended queue */
        int size = deque.Count;
        Console.WriteLine("Length of the double-ended queue size =" + size);

        /* Determine if the double-ended queue is empty */
        bool isEmpty = deque.Count == 0;
        Console.WriteLine("Is the double-ended queue empty =" + isEmpty);
    }
}
