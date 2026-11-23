/**
 * File: array_deque.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Deque implemented with a circular array */
public class ArrayDeque {
    int[] nums;  // Array that stores the deque elements
    int front;   // Front pointer, pointing to the first element
    int queSize; // Deque size

    /* Constructor */
    public ArrayDeque(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* Get the deque capacity */
    int Capacity() {
        return nums.Length;
    }

    /* Get the deque size */
    public int Size() {
        return queSize;
    }

    /* Check whether the deque is empty */
    public bool IsEmpty() {
        return queSize == 0;
    }

    /* Calculate an index in the circular array */
    int Index(int i) {
        // Use modulo to connect the end of the array to its beginning
        // When i passes the end of the array, wrap around to the beginning
        // When i passes the beginning of the array, wrap around to the end
        return (i + Capacity()) % Capacity();
    }

    /* Enqueue at the front */
    public void PushFirst(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("Deque is full");
            return;
        }
        // Move the front pointer one position to the left
        // Use modulo to wrap front to the end when it passes the beginning of the array
        front = Index(front - 1);
        // Add num to the front
        nums[front] = num;
        queSize++;
    }

    /* Enqueue at the rear */
    public void PushLast(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("Deque is full");
            return;
        }
        // Calculate the rear pointer, which points one position past the last element
        int rear = Index(front + queSize);
        // Add num to the rear
        nums[rear] = num;
        queSize++;
    }

    /* Dequeue from the front */
    public int PopFirst() {
        int num = PeekFirst();
        // Advance the front pointer by one position
        front = Index(front + 1);
        queSize--;
        return num;
    }

    /* Dequeue from the rear */
    public int PopLast() {
        int num = PeekLast();
        queSize--;
        return num;
    }

    /* Access the front element */
    public int PeekFirst() {
        if (IsEmpty()) {
            throw new InvalidOperationException();
        }
        return nums[front];
    }

    /* Access the rear element */
    public int PeekLast() {
        if (IsEmpty()) {
            throw new InvalidOperationException();
        }
        // Calculate the index of the last element
        int last = Index(front + queSize - 1);
        return nums[last];
    }

    /* Return an array for printing */
    public int[] ToArray() {
        // Copy only the elements within the occupied range
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
        /* Initialize the deque */
        ArrayDeque deque = new(10);
        deque.PushLast(3);
        deque.PushLast(2);
        deque.PushLast(5);
        Console.WriteLine("Deque deque = " + string.Join(" ", deque.ToArray()));

        /* Access an element */
        int peekFirst = deque.PeekFirst();
        Console.WriteLine("Front element peekFirst = " + peekFirst);
        int peekLast = deque.PeekLast();
        Console.WriteLine("Rear element peekLast = " + peekLast);

        /* Enqueue elements */
        deque.PushLast(4);
        Console.WriteLine("After enqueuing element 4 at the rear, deque = " + string.Join(" ", deque.ToArray()));
        deque.PushFirst(1);
        Console.WriteLine("After enqueuing element 1 at the front, deque = " + string.Join(" ", deque.ToArray()));

        /* Dequeue an element */
        int popLast = deque.PopLast();
        Console.WriteLine("Element dequeued from the rear = " + popLast + ", after dequeuing from the rear, deque = " + string.Join(" ", deque.ToArray()));
        int popFirst = deque.PopFirst();
        Console.WriteLine("Element dequeued from the front = " + popFirst + ", after dequeuing from the front, deque = " + string.Join(" ", deque.ToArray()));

        /* Get the deque size */
        int size = deque.Size();
        Console.WriteLine("Deque size = " + size);

        /* Check whether the deque is empty */
        bool isEmpty = deque.IsEmpty();
        Console.WriteLine("Is the deque empty = " + isEmpty);
    }
}
