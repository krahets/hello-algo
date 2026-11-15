/**
 * File: queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class queue {
    [Test]
    public void Test() {
        // [region]{init_queue}
        /* Initialize the queue */
        Queue<int> queue = new();
        // [endregion]{init_queue}

        // [region]{push}
        /* Enqueue elements */
        queue.Enqueue(1);
        queue.Enqueue(3);
        queue.Enqueue(2);
        queue.Enqueue(5);
        queue.Enqueue(4);
        // [endregion]{push}
        Console.WriteLine("Queue queue = " + string.Join(",", queue));

        // [region]{peek}
        /* Access the front element */
        int peek = queue.Peek();
        // [endregion]{peek}
        Console.WriteLine("Front element peek = " + peek);

        // [region]{pop}
        /* Dequeue an element */
        int pop = queue.Dequeue();
        // [endregion]{pop}
        Console.WriteLine("Dequeued element pop = " + pop + ", after dequeuing, queue = " + string.Join(",", queue));

        // [region]{size}
        /* Get the queue size */
        int size = queue.Count;
        // [endregion]{size}
        Console.WriteLine("Queue size = " + size);

        // [region]{is_empty}
        /* Check whether the queue is empty */
        bool isEmpty = queue.Count == 0;
        // [endregion]{is_empty}
        Console.WriteLine("Is the queue empty = " + isEmpty);
    }
}
