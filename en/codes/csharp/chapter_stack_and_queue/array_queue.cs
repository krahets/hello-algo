/**
 * File: array_queue.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Queue class based on circular array */
class ArrayQueue {
    int[] nums;  // Array for storing queue elements
    int front;   // Front pointer, pointing to the front element
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

    /* Determine if the queue is empty */
    public bool IsEmpty() {
        return queSize == 0;
    }

    /* Enqueue */
    public void Push(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("Queue is full");
            return;
        }
        // Calculate rear pointer, pointing to rear index + 1
        // Use modulo operation to wrap the rear pointer from the end of the array back to the start
        int rear = (front + queSize) % Capacity();
        // Add num to the rear
        nums[rear] = num;
        queSize++;
    }

    /* Dequeue */
    public int Pop() {
        int num = Peek();
        // Move front pointer one position backward, returning to the head of the array if it exceeds the tail
        front = (front + 1) % Capacity();
        queSize--;
        return num;
    }

    /* Access front element */
    public int Peek() {
        if (IsEmpty())
            throw new Exception();
        return nums[front];
    }

    /* Return array */
    public int[] ToArray() {
        // Only convert elements within valid length range
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
        /* Initialize queue */
        int capacity = 10;
        ArrayQueue queue = new(capacity);

        /* Element enqueue */
        queue.Push(1);
        queue.Push(3);
        queue.Push(2);
        queue.Push(5);
        queue.Push(4);
        Console.WriteLine("Queue = " + string.Join(", ", queue.ToArray()));

        /* Access front element */
        int peek = queue.Peek();
        Console.WriteLine("Front element peek =" + peek);

        /* Element dequeue */
        int pop = queue.Pop();
        Console.WriteLine("Element popped from the queue = " + pop + ", queue after dequeuing = " + string.Join(", ", queue.ToArray()));

        /* Get the length of the queue */
        int size = queue.Size();
        Console.WriteLine("Length of the queue size =" + size);

        /* Determine if the queue is empty */
        bool isEmpty = queue.IsEmpty();
        Console.WriteLine("Is the queue empty =" + isEmpty);

        /* Test circular array */
        for (int i = 0; i < 10; i++) {
            queue.Push(i);
            queue.Pop();
            Console.WriteLine("After the " + i + "th round of enqueuing and dequeuing, the queue = " + string.Join(", ", queue.ToArray()));
        }
    }
}
