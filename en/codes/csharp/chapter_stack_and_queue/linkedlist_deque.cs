/**
 * File: linkedlist_deque.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Double-linked list node */
public class ListNode(int val) {
    public int val = val;       // Node value
    public ListNode? next = null; // Reference to successor node
    public ListNode? prev = null; // Reference to predecessor node
}

/* Double-ended queue class based on double-linked list */
public class LinkedListDeque {
    ListNode? front, rear; // Front node front, rear node rear
    int queSize = 0;      // Length of the double-ended queue

    public LinkedListDeque() {
        front = null;
        rear = null;
    }

    /* Get the length of the double-ended queue */
    public int Size() {
        return queSize;
    }

    /* Determine if the double-ended queue is empty */
    public bool IsEmpty() {
        return Size() == 0;
    }

    /* Enqueue operation */
    void Push(int num, bool isFront) {
        ListNode node = new(num);
        // If the list is empty, make front and rear both point to node
        if (IsEmpty()) {
            front = node;
            rear = node;
        }
        // Front enqueue operation
        else if (isFront) {
            // Add node to the head of the list
            front!.prev = node;
            node.next = front;
            front = node; // Update the front node
        }
        // Rear enqueue operation
        else {
            // Add node to the tail of the list
            rear!.next = node;
            node.prev = rear;
            rear = node;  // Update tail node
        }

        queSize++; // Update queue length
    }

    /* Front enqueue */
    public void PushFirst(int num) {
        Push(num, true);
    }

    /* Rear enqueue */
    public void PushLast(int num) {
        Push(num, false);
    }

    /* Dequeue operation */
    int? Pop(bool isFront) {
        if (IsEmpty())
            throw new Exception();
        int? val;
        // Front dequeue operation
        if (isFront) {
            val = front?.val; // Temporarily store the head node value
            // Remove head node
            ListNode? fNext = front?.next;
            if (fNext != null) {
                fNext.prev = null;
                front!.next = null;
            }
            front = fNext;   // Update head node
        }
        // Rear dequeue operation
        else {
            val = rear?.val;  // Temporarily store the tail node value
            // Remove tail node
            ListNode? rPrev = rear?.prev;
            if (rPrev != null) {
                rPrev.next = null;
                rear!.prev = null;
            }
            rear = rPrev;    // Update tail node
        }

        queSize--; // Update queue length
        return val;
    }

    /* Front dequeue */
    public int? PopFirst() {
        return Pop(true);
    }

    /* Rear dequeue */
    public int? PopLast() {
        return Pop(false);
    }

    /* Access front element */
    public int? PeekFirst() {
        if (IsEmpty())
            throw new Exception();
        return front?.val;
    }

    /* Access rear element */
    public int? PeekLast() {
        if (IsEmpty())
            throw new Exception();
        return rear?.val;
    }

    /* Return array for printing */
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
        /* Initialize double-ended queue */
        LinkedListDeque deque = new();
        deque.PushLast(3);
        deque.PushLast(2);
        deque.PushLast(5);
        Console.WriteLine("Deque = " + string.Join(" ", deque.ToArray()));

        /* Access element */
        int? peekFirst = deque.PeekFirst();
        Console.WriteLine("Front element peekFirst =" + peekFirst);
        int? peekLast = deque.PeekLast();
        Console.WriteLine("Back element peekLast =" + peekLast);

        /* Element enqueue */
        deque.PushLast(4);
        Console.WriteLine("Element 4 after being enqueued at the back of the deque = " + string.Join(" ", deque.ToArray()));
        deque.PushFirst(1);
        Console.WriteLine("Element 1 after being enqueued at the front of the deque = " + string.Join(" ", deque.ToArray()));

        /* Element dequeue */
        int? popLast = deque.PopLast();
        Console.WriteLine("Deque element at the back after being dequeued = " + popLast + ", deque after dequeuing at the back = " + string.Join(" ", deque.ToArray()));
        int? popFirst = deque.PopFirst();
        Console.WriteLine("Deque element at the front after being dequeued = " + popFirst + ", deque after dequeuing at the front = " + string.Join(" ", deque.ToArray()));

        /* Get the length of the double-ended queue */
        int size = deque.Size();
        Console.WriteLine("Length of the double-ended queue size =" + size);

        /* Determine if the double-ended queue is empty */
        bool isEmpty = deque.IsEmpty();
        Console.WriteLine("Is the double-ended queue empty =" + isEmpty);
    }
}
