/**
 * File: queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

public class queue {
    [Test]
    public void Test() {
        /* Initialize queue */
        Queue<int> queue = new();

        /* Element enqueue */
        queue.Enqueue(1);
        queue.Enqueue(3);
        queue.Enqueue(2);
        queue.Enqueue(5);
        queue.Enqueue(4);
        Console.WriteLine("Queue = " + string.Join(", ", queue));

        /* Access front element */
        int peek = queue.Peek();
        Console.WriteLine("Front element peek =" + peek);

        /* Element dequeue */
        int pop = queue.Dequeue();
        Console.WriteLine("Element popped from the queue = " + pop + ", queue after dequeuing = " + string.Join(", ", queue));

        /* Get the length of the queue */
        int size = queue.Count;
        Console.WriteLine("Length of the queue size =" + size);

        /* Determine if the queue is empty */
        bool isEmpty = queue.Count == 0;
        Console.WriteLine("Is the queue empty =" + isEmpty);
    }
}
