/**
 * File: array_deque.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Double-ended queue class based on circular array */
public class ArrayDeque {
    int[] nums;  // Array used to store elements of the double-ended queue
    int front;   // Front pointer, pointing to the front element
    int queSize; // Length of the double-ended queue

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

    /* Determine if the double-ended queue is empty */
    public bool IsEmpty() {
        return queSize == 0;
    }

    /* Calculate circular array index */
    int Index(int i) {
        // Implement circular array by modulo operation
        // When i exceeds the tail of the array, return to the head
        // When i exceeds the head of the array, return to the tail
        return (i + Capacity()) % Capacity();
    }

    /* Front enqueue */
    public void PushFirst(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("Double-ended queue is full");
            return;
        }
        // Move the front pointer one position to the left
        // Implement front crossing the head of the array to return to the tail by modulo operation
        front = Index(front - 1);
        // Add num to the front
        nums[front] = num;
        queSize++;
    }

    /* Rear enqueue */
    public void PushLast(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("Double-ended queue is full");
            return;
        }
        // Calculate rear pointer, pointing to rear index + 1
        int rear = Index(front + queSize);
        // Add num to the rear
        nums[rear] = num;
        queSize++;
    }

    /* Front dequeue */
    public int PopFirst() {
        int num = PeekFirst();
        // Move front pointer one position backward
        front = Index(front + 1);
        queSize--;
        return num;
    }

    /* Rear dequeue */
    public int PopLast() {
        int num = PeekLast();
        queSize--;
        return num;
    }

    /* Access front element */
    public int PeekFirst() {
        if (IsEmpty()) {
            throw new InvalidOperationException();
        }
        return nums[front];
    }

    /* Access rear element */
    public int PeekLast() {
        if (IsEmpty()) {
            throw new InvalidOperationException();
        }
        // Calculate rear element index
        int last = Index(front + queSize - 1);
        return nums[last];
    }

    /* Return array for printing */
    public int[] ToArray() {
        // Only convert elements within valid length range
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
        /* Initialize double-ended queue */
        ArrayDeque deque = new(10);
        deque.PushLast(3);
        deque.PushLast(2);
        deque.PushLast(5);
        Console.WriteLine("Deque = " + string.Join(" ", deque.ToArray()));

        /* Access element */
        int peekFirst = deque.PeekFirst();
        Console.WriteLine("Front element peekFirst =" + peekFirst);
        int peekLast = deque.PeekLast();
        Console.WriteLine("Back element peekLast =" + peekLast);

        /* Element enqueue */
        deque.PushLast(4);
        Console.WriteLine("Element 4 after being enqueued at the back of the deque = " + string.Join(" ", deque.ToArray()));
        deque.PushFirst(1);
        Console.WriteLine("Element 1 after being enqueued at the front of the deque = " + string.Join(" ", deque.ToArray()));

        /* Element dequeue */
        int popLast = deque.PopLast();
        Console.WriteLine("Deque element at the back after being dequeued = " + popLast + ", deque after dequeuing at the back = " + string.Join(" ", deque.ToArray()));
        int popFirst = deque.PopFirst();
        Console.WriteLine("Deque element at the front after being dequeued = " + popFirst + ", deque after dequeuing at the front = " + string.Join(" ", deque.ToArray()));

        /* Get the length of the double-ended queue */
        int size = deque.Size();
        Console.WriteLine("Length of the double-ended queue size =" + size);

        /* Determine if the double-ended queue is empty */
        bool isEmpty = deque.IsEmpty();
        Console.WriteLine("Is the double-ended queue empty =" + isEmpty);
    }
}
