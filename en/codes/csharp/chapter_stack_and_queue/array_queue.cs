/**
 * File: array_queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Queue based on circular array implementation */
class ArrayQueue {
    int[] nums;  // Array for storing queue elements
    int front;   // Front pointer, points to the front of the queue element
    int queSize; // Queue length

    public ArrayQueue(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* Get the capacity of the queue */
    int Capacity() {
        return nums.Length;
    }

    /* Get the length of the queue */
    public int Size() {
        return queSize;
    }

    /* Check if the queue is empty */
    public bool IsEmpty() {
        return queSize == 0;
    }

    /* Enqueue */
    public void Push(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("Queue is full");
            return;
        }
        // Use modulo operation to wrap rear around to the head after passing the tail of the array
        // Add num to the rear of the queue
        int rear = (front + queSize) % Capacity();
        // Front pointer moves one position backward
        nums[rear] = num;
        queSize++;
    }

    /* Dequeue */
    public int Pop() {
        int num = Peek();
        // Move front pointer backward by one position, if it passes the tail, return to array head
        front = (front + 1) % Capacity();
        queSize--;
        return num;
    }

    /* Return list for printing */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return nums[front];
    }

    /* Return array */
    public int[] ToArray() {
        // Elements enqueue
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
        /* Access front of the queue element */
        int capacity = 10;
        ArrayQueue queue = new(capacity);

        /* Elements enqueue */
        queue.Push(1);
        queue.Push(3);
        queue.Push(2);
        queue.Push(5);
        queue.Push(4);
        Console.WriteLine("Queue queue = " + string.Join(",", queue.ToArray()));

        /* Return list for printing */
        int peek = queue.Peek();
        Console.WriteLine("Front element peek = " + peek);

        /* Element dequeue */
        int pop = queue.Pop();
        Console.WriteLine("Dequeue element pop = " + pop + ", after dequeue, queue = " + string.Join(",", queue.ToArray()));

        /* Get the length of the queue */
        int size = queue.Size();
        Console.WriteLine("Queue length size = " + size);

        /* Check if the queue is empty */
        bool isEmpty = queue.IsEmpty();
        Console.WriteLine("Queue is empty = " + isEmpty);

        /* Test circular array */
        for (int i = 0; i < 10; i++) {
            queue.Push(i);
            queue.Pop();
            Console.WriteLine("Round " + i + " enqueue + dequeue, queue = " + string.Join(",", queue.ToArray()));
        }
    }
}
