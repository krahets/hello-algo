/**
 * File: array_queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Queue implemented with a circular array */
class ArrayQueue {
    int[] nums;  // Array that stores the queue elements
    int front;   // Front pointer, pointing to the first element
    int queSize; // Queue size

    public ArrayQueue(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* Get the queue capacity */
    int Capacity() {
        return nums.Length;
    }

    /* Get the queue size */
    public int Size() {
        return queSize;
    }

    /* Check whether the queue is empty */
    public bool IsEmpty() {
        return queSize == 0;
    }

    /* Enqueue */
    public void Push(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("Queue is full");
            return;
        }
        // Calculate the rear pointer, which points one position past the last element
        // Use modulo to wrap rear to the beginning when it passes the end of the array
        int rear = (front + queSize) % Capacity();
        // Add num to the rear
        nums[rear] = num;
        queSize++;
    }

    /* Dequeue */
    public int Pop() {
        int num = Peek();
        // Advance the front pointer by one position, wrapping to the beginning if it passes the end
        front = (front + 1) % Capacity();
        queSize--;
        return num;
    }

    /* Access the front element */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return nums[front];
    }

    /* Return an array */
    public int[] ToArray() {
        // Copy only the elements within the occupied range
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[j % this.Capacity()];
        }
        return res;
    }
}

public class array_queue {
    [Test]
    public void Test() {
        /* Initialize the queue */
        int capacity = 10;
        ArrayQueue queue = new(capacity);

        /* Enqueue elements */
        queue.Push(1);
        queue.Push(3);
        queue.Push(2);
        queue.Push(5);
        queue.Push(4);
        Console.WriteLine("Queue queue = " + string.Join(",", queue.ToArray()));

        /* Access the front element */
        int peek = queue.Peek();
        Console.WriteLine("Front element peek = " + peek);

        /* Dequeue an element */
        int pop = queue.Pop();
        Console.WriteLine("Dequeued element pop = " + pop + ", after dequeuing, queue = " + string.Join(",", queue.ToArray()));

        /* Get the queue size */
        int size = queue.Size();
        Console.WriteLine("Queue size = " + size);

        /* Check whether the queue is empty */
        bool isEmpty = queue.IsEmpty();
        Console.WriteLine("Is the queue empty = " + isEmpty);

        /* Test the circular array */
        for (int i = 0; i < 10; i++) {
            queue.Push(i);
            queue.Pop();
            Console.WriteLine("Round " + i + " : after enqueue + dequeue, queue = " + string.Join(",", queue.ToArray()));
        }
    }
}
