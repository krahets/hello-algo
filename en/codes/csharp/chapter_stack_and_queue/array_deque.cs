/**
 * File: array_deque.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Double-ended queue based on circular array implementation */
public class ArrayDeque {
    int[] nums;  // Array for storing double-ended queue elements
    int front;   // Front pointer, points to the front of the queue element
    int queSize; // Double-ended queue length

    /* Constructor */
    public ArrayDeque(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* Get the capacity of the double-ended queue */
    int Capacity() {
        return nums.Length;
    }

    /* Get the length of the double-ended queue */
    public int Size() {
        return queSize;
    }

    /* Check if the double-ended queue is empty */
    public bool IsEmpty() {
        return queSize == 0;
    }

    /* Calculate circular array index */
    int Index(int i) {
        // Use modulo operation to wrap the array head and tail together
        // When i passes the tail of the array, return to the head
        // When i passes the head of the array, return to the tail
        return (i + Capacity()) % Capacity();
    }

    /* Front of the queue enqueue */
    public void PushFirst(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("Double-ended queue is full");
            return;
        }
        // Use modulo operation to wrap front around to the tail after passing the head of the array
        // Add num to the front of the queue
        front = Index(front - 1);
        // Add num to front of queue
        nums[front] = num;
        queSize++;
    }

    /* Rear of the queue enqueue */
    public void PushLast(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("Double-ended queue is full");
            return;
        }
        // Use modulo operation to wrap rear around to the head after passing the tail of the array
        int rear = Index(front + queSize);
        // Front pointer moves one position backward
        nums[rear] = num;
        queSize++;
    }

    /* Rear of the queue dequeue */
    public int PopFirst() {
        int num = PeekFirst();
        // Move front pointer backward by one position
        front = Index(front + 1);
        queSize--;
        return num;
    }

    /* Access rear of the queue element */
    public int PopLast() {
        int num = PeekLast();
        queSize--;
        return num;
    }

    /* Return list for printing */
    public int PeekFirst() {
        if (IsEmpty()) {
            throw new InvalidOperationException();
        }
        return nums[front];
    }

    /* Driver Code */
    public int PeekLast() {
        if (IsEmpty()) {
            throw new InvalidOperationException();
        }
        // Initialize double-ended queue
        int last = Index(front + queSize - 1);
        return nums[last];
    }

    /* Return array for printing */
    public int[] ToArray() {
        // Elements enqueue
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[Index(j)];
        }
        return res;
    }
}

public class array_deque {
    [Test]
    public void Test() {
        /* Get the length of the double-ended queue */
        ArrayDeque deque = new(10);
        deque.PushLast(3);
        deque.PushLast(2);
        deque.PushLast(5);
        Console.WriteLine("Double-ended queue deque = " + string.Join(" ", deque.ToArray()));

        /* Update element */
        int peekFirst = deque.PeekFirst();
        Console.WriteLine("Front element peekFirst = " + peekFirst);
        int peekLast = deque.PeekLast();
        Console.WriteLine("Rear element peekLast = " + peekLast);

        /* Elements enqueue */
        deque.PushLast(4);
        Console.WriteLine("After element 4 enqueues at rear, deque = " + string.Join(" ", deque.ToArray()));
        deque.PushFirst(1);
        Console.WriteLine("After element 1 enqueues at front, deque = " + string.Join(" ", deque.ToArray()));

        /* Element dequeue */
        int popLast = deque.PopLast();
        Console.WriteLine("Rear dequeue element = " + popLast + ", after rear dequeue, deque = " + string.Join(" ", deque.ToArray()));
        int popFirst = deque.PopFirst();
        Console.WriteLine("Front dequeue element = " + popFirst + ", after front dequeue, deque = " + string.Join(" ", deque.ToArray()));

        /* Get the length of the double-ended queue */
        int size = deque.Size();
        Console.WriteLine("Double-ended queue length size = " + size);

        /* Check if the double-ended queue is empty */
        bool isEmpty = deque.IsEmpty();
        Console.WriteLine("Double-ended queue is empty = " + isEmpty);
    }
}
