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

/* Deque backed by a doubly linked list */
public class LinkedListDeque {
    ListNode? front, rear; // front points to the head node and rear to the tail node
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

    /* Add an element at either end */
    void Push(int num, bool isFront) {
        ListNode node = new(num);
        // If the list is empty, point both front and rear at node
        if (IsEmpty()) {
            front = node;
            rear = node;
        }
        // Add at the front
        else if (isFront) {
            // Link node at the head of the list
            front!.prev = node;
            node.next = front;
            front = node; // Update the head                           
        }
        // Add at the rear
        else {
            // Link node at the tail of the list
            rear!.next = node;
            node.prev = rear;
            rear = node;  // Update the tail
        }

        queSize++; // Update the deque size
    }

    /* Add an element at the front */
    public void PushFirst(int num) {
        Push(num, true);
    }

    /* Add an element at the rear */
    public void PushLast(int num) {
        Push(num, false);
    }

    /* Remove an element from either end */
    int? Pop(bool isFront) {
        if (IsEmpty())
            throw new Exception();
        int? val;
        // When the deque contains one element, the head and tail point to the same node
        if (queSize == 1) {
            val = front!.val;
            front = null;
            rear = null;
        }
        // Remove from the front
        else if (isFront) {
            val = front!.val; // Save the head node's value
            // Remove the head node
            ListNode? fNext = front?.next;
            fNext!.prev = null;
            front.next = null;
            front = fNext;   // Update the head
        }
        // Remove from the rear
        else {
            val = rear!.val;  // Save the tail node's value
            // Remove the tail node
            ListNode? rPrev = rear?.prev;
            rPrev!.next = null;
            rear.prev = null;
            rear = rPrev;    // Update the tail
        }

        queSize--; // Update the deque size
        return val;
    }

    /* Remove and return the front element */
    public int? PopFirst() {
        return Pop(true);
    }

    /* Remove and return the rear element */
    public int? PopLast() {
        return Pop(false);
    }

    /* Peek at the front element */
    public int? PeekFirst() {
        if (IsEmpty())
            throw new Exception();
        return front?.val;
    }

    /* Peek at the rear element */
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
        Console.WriteLine("deque = " + string.Join(" ", deque.ToArray()));

        /* Peek at the front and rear elements */
        int? peekFirst = deque.PeekFirst();
        Console.WriteLine("Front element (peekFirst) = " + peekFirst);
        int? peekLast = deque.PeekLast();
        Console.WriteLine("Rear element (peekLast) = " + peekLast);

        /* Add elements to the deque */
        deque.PushLast(4);
        Console.WriteLine("After adding 4 at the rear, deque = " + string.Join(" ", deque.ToArray()));
        deque.PushFirst(1);
        Console.WriteLine("After adding 1 at the front, deque = " + string.Join(" ", deque.ToArray()));

        /* Remove elements from both ends */
        int? popLast = deque.PopLast();
        Console.WriteLine("Removed from the rear = " + popLast + ", deque after removal = " + string.Join(" ", deque.ToArray()));
        int? popFirst = deque.PopFirst();
        Console.WriteLine("Removed from the front = " + popFirst + ", deque after removal = " + string.Join(" ", deque.ToArray()));

        /* Get the deque size */
        int size = deque.Size();
        Console.WriteLine("Deque size = " + size);

        /* Check whether the deque is empty */
        bool isEmpty = deque.IsEmpty();
        Console.WriteLine("Deque is empty = " + isEmpty);
    }
}
