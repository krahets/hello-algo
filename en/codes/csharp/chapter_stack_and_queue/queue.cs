/**
 * File: queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class queue {
    [Test]
    public void Test() {
        /* Access front of the queue element */
        Queue<int> queue = new();

        /* Elements enqueue */
        queue.Enqueue(1);
        queue.Enqueue(3);
        queue.Enqueue(2);
        queue.Enqueue(5);
        queue.Enqueue(4);
        Console.WriteLine("Queue queue = " + string.Join(",", queue));

        /* Return list for printing */
        int peek = queue.Peek();
        Console.WriteLine("Front element peek = " + peek);

        /* Element dequeue */
        int pop = queue.Dequeue();
        Console.WriteLine("Dequeue element pop = " + pop + ", after dequeue, queue = " + string.Join(",", queue));

        /* Get the length of the queue */
        int size = queue.Count;
        Console.WriteLine("Queue length size = " + size);

        /* Check if the queue is empty */
        bool isEmpty = queue.Count == 0;
        Console.WriteLine("Queue is empty = " + isEmpty);
    }
}
