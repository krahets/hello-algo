/**
 * File: array_deque.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Deque backed by a circular array */
public class ArrayDeque {
    int[] nums;  // Array that stores the deque elements
    int front;   // Index of the front element
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

    /* Compute the circular array index */
    int Index(int i) {
        // Use the remainder to wrap indices around the array
        // When i goes past the end, wrap it back to the start
        // When i goes before the start, wrap it around to the end
        return (i + Capacity()) % Capacity();
    }

    /* Add an element at the front */
    public void PushFirst(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("Deque is full");
            return;
        }
        // Move the front index one slot to the left
        // Use the remainder to wrap front to the end if it goes before the start
        front = Index(front - 1);
        // Add num at the front
        nums[front] = num;
        queSize++;
    }

    /* Add an element at the rear */
    public void PushLast(int num) {
        if (queSize == Capacity()) {
            Console.WriteLine("Deque is full");
            return;
        }
        // Compute the index one slot past the rear element
        int rear = Index(front + queSize);
        // Add num at the rear
        nums[rear] = num;
        queSize++;
    }

    /* Remove and return the front element */
    public int PopFirst() {
        int num = PeekFirst();
        // Advance the front index by one
        front = Index(front + 1);
        queSize--;
        return num;
    }

    /* Remove and return the rear element */
    public int PopLast() {
        int num = PeekLast();
        queSize--;
        return num;
    }

    /* Peek at the front element */
    public int PeekFirst() {
        if (IsEmpty()) {
            throw new InvalidOperationException();
        }
        return nums[front];
    }

    /* Peek at the rear element */
    public int PeekLast() {
        if (IsEmpty()) {
            throw new InvalidOperationException();
        }
        // Compute the index of the rear element
        int last = Index(front + queSize - 1);
        return nums[last];
    }

    /* Return an array for printing */
    public int[] ToArray() {
        // Copy only the elements currently in the deque
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
        Console.WriteLine("deque = " + string.Join(" ", deque.ToArray()));

        /* Peek at the front and rear elements */
        int peekFirst = deque.PeekFirst();
        Console.WriteLine("Front element (peekFirst) = " + peekFirst);
        int peekLast = deque.PeekLast();
        Console.WriteLine("Rear element (peekLast) = " + peekLast);

        /* Add elements to the deque */
        deque.PushLast(4);
        Console.WriteLine("After adding 4 at the rear, deque = " + string.Join(" ", deque.ToArray()));
        deque.PushFirst(1);
        Console.WriteLine("After adding 1 at the front, deque = " + string.Join(" ", deque.ToArray()));

        /* Remove elements from both ends */
        int popLast = deque.PopLast();
        Console.WriteLine("Removed from the rear = " + popLast + ", deque after removal = " + string.Join(" ", deque.ToArray()));
        int popFirst = deque.PopFirst();
        Console.WriteLine("Removed from the front = " + popFirst + ", deque after removal = " + string.Join(" ", deque.ToArray()));

        /* Get the deque size */
        int size = deque.Size();
        Console.WriteLine("Deque size = " + size);

        /* Check whether the deque is empty */
        bool isEmpty = deque.IsEmpty();
        Console.WriteLine("Deque is empty = " + isEmpty);
    }
}
