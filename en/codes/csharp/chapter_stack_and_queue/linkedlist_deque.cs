/**
 * File: linkedlist_deque.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Doubly linked list node */
public class ListNode(int val) {
    public int val = val;       // Node value
    public ListNode? next = null; // Reference to the next node
    public ListNode? prev = null; // Reference to the previous node
}

/* Deque implemented with a doubly linked list */
public class LinkedListDeque {
    ListNode? front, rear; // Head node front and tail node rear
    int queSize = 0;      // Deque size

    public LinkedListDeque() {
        front = null;
        rear = null;
    }

    /* Get the deque size */
    public int Size() {
        return queSize;
    }

    /* Check whether the deque is empty */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* Enqueue operation */
    void Push(int num, bool isFront) {
        ListNode node = new(num);
        // If the linked list is empty, make both front and rear point to node
        if (IsEmpty()) {
            front = node;
            rear = node;
        }
        // Enqueue at the front
        else if (isFront) {
            // Add node to the head of the linked list
            front!.prev = node;
            node.next = front;
            front = node; // Update the head node                           
        }
        // Enqueue at the rear
        else {
            // Add node to the tail of the linked list
            rear!.next = node;
            node.prev = rear;
            rear = node;  // Update the tail node
        }

        queSize++; // Update the queue size
    }

    /* Enqueue at the front */
    public void PushFirst(int num) {
        Push(num, true);
    }

    /* Enqueue at the rear */
    public void PushLast(int num) {
        Push(num, false);
    }

    /* Dequeue operation */
    int? Pop(bool isFront) {
        if (IsEmpty())
            throw new Exception();
        int? val;
        // When the queue size is 1, the head and tail point to the same node
        if (queSize == 1) {
            val = front!.val;
            front = null;
            rear = null;
        }
        // Dequeue from the front
        else if (isFront) {
            val = front!.val; // Save the head node value
            // Remove the head node
            ListNode? fNext = front?.next;
            fNext!.prev = null;
            front.next = null;
            front = fNext;   // Update the head node
        }
        // Dequeue from the rear
        else {
            val = rear!.val;  // Save the tail node value
            // Remove the tail node
            ListNode? rPrev = rear?.prev;
            rPrev!.next = null;
            rear.prev = null;
            rear = rPrev;    // Update the tail node
        }

        queSize--; // Update the queue size
        return val;
    }

    /* Dequeue from the front */
    public int? PopFirst() {
        return Pop(true);
    }

    /* Dequeue from the rear */
    public int? PopLast() {
        return Pop(false);
    }

    /* Access the front element */
    public int? PeekFirst() {
        if (IsEmpty())
            throw new Exception();
        return front?.val;
    }

    /* Access the rear element */
    public int? PeekLast() {
        if (IsEmpty())
            throw new Exception();
        return rear?.val;
    }

    /* Return an array for printing */
    public int?[] ToArray() {
        ListNode? node = front;
        int?[] res = new int?[Size()];
        for (int i = 0; i < res.Length; i++) {
            res[i] = node?.val;
            node = node?.next;
        }

        return res;
    }
}

public class linkedlist_deque {
    [Test]
    public void Test() {
        /* Initialize the deque */
        LinkedListDeque deque = new();
        deque.PushLast(3);
        deque.PushLast(2);
        deque.PushLast(5);
        Console.WriteLine("Deque deque = " + string.Join(" ", deque.ToArray()));

        /* Access an element */
        int? peekFirst = deque.PeekFirst();
        Console.WriteLine("Front element peekFirst = " + peekFirst);
        int? peekLast = deque.PeekLast();
        Console.WriteLine("Rear element peekLast = " + peekLast);

        /* Enqueue elements */
        deque.PushLast(4);
        Console.WriteLine("After enqueuing element 4 at the rear, deque = " + string.Join(" ", deque.ToArray()));
        deque.PushFirst(1);
        Console.WriteLine("After enqueuing element 1 at the front, deque = " + string.Join(" ", deque.ToArray()));

        /* Dequeue an element */
        int? popLast = deque.PopLast();
        Console.WriteLine("Element dequeued from the rear = " + popLast + ", after dequeuing from the rear, deque = " + string.Join(" ", deque.ToArray()));
        int? popFirst = deque.PopFirst();
        Console.WriteLine("Element dequeued from the front = " + popFirst + ", after dequeuing from the front, deque = " + string.Join(" ", deque.ToArray()));

        /* Get the deque size */
        int size = deque.Size();
        Console.WriteLine("Deque size = " + size);

        /* Check whether the deque is empty */
        bool isEmpty = deque.IsEmpty();
        Console.WriteLine("Is the deque empty = " + isEmpty);
    }
}
