/**
 * File: deque.cs
 * Created Time: 2022-12-30
 * Author: moonache (microin1301@outlook.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class deque {
    [Test]
    public void Test() {
        // [region]{init_deque}
        /* Initialize the deque */
        // In C#, use the linked list LinkedList as a deque
        LinkedList<int> deque = new();
        // [endregion]{init_deque}

        // [region]{push}
        /* Enqueue elements */
        deque.AddLast(2);   // Add to the rear
        deque.AddLast(5);
        deque.AddLast(4);
        deque.AddFirst(3);  // Add to the front
        deque.AddFirst(1);
        // [endregion]{push}
        Console.WriteLine("Deque deque = " + string.Join(",", deque));

        // [region]{peek_first}
        /* Access an element */
        int? peekFirst = deque.First?.Value;  // Front element
        // [endregion]{peek_first}
        Console.WriteLine("Front element peekFirst = " + peekFirst);
        // [region]{peek_last}
        int? peekLast = deque.Last?.Value;    // Rear element
        // [endregion]{peek_last}
        Console.WriteLine("Rear element peekLast = " + peekLast);

        // [region]{pop_first}
        /* Dequeue an element */
        deque.RemoveFirst();  // Dequeue the front element
        // [endregion]{pop_first}
        Console.WriteLine("After dequeuing the front element, deque = " + string.Join(",", deque));
        // [region]{pop_last}
        deque.RemoveLast();   // Dequeue the rear element
        // [endregion]{pop_last}
        Console.WriteLine("After dequeuing the rear element, deque = " + string.Join(",", deque));

        // [region]{size}
        /* Get the deque size */
        int size = deque.Count;
        // [endregion]{size}
        Console.WriteLine("Deque size = " + size);

        // [region]{is_empty}
        /* Check whether the deque is empty */
        bool isEmpty = deque.Count == 0;
        // [endregion]{is_empty}
        Console.WriteLine("Is the deque empty = " + isEmpty);
    }
}
