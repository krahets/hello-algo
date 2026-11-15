/**
 * File: queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class queue {
    [Test]
    public void Test() {
        /* Initialize the queue */
        Queue<int> queue = new();

        /* Enqueue elements */
        queue.Enqueue(1);
        queue.Enqueue(3);
        queue.Enqueue(2);
        queue.Enqueue(5);
        queue.Enqueue(4);
        Console.WriteLine("Queue queue = " + string.Join(",", queue));

        /* Access the front element */
        int peek = queue.Peek();
        Console.WriteLine("Front element peek = " + peek);

        /* Dequeue an element */
        int pop = queue.Dequeue();
        Console.WriteLine("Dequeued element pop = " + pop + ", after dequeuing, queue = " + string.Join(",", queue));

        /* Get the queue size */
        int size = queue.Count;
        Console.WriteLine("Queue size = " + size);

        /* Check whether the queue is empty */
        bool isEmpty = queue.Count == 0;
        Console.WriteLine("Is the queue empty = " + isEmpty);
    }
}
