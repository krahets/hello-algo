/**
 * File: linkedlist_deque.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_stack_and_queue;

/* Doubly linked list node */
public class ListNode(int val) {
    public int val = val;       // Node value
    public ListNode? next = null; // Successor node reference
    public ListNode? prev = null; // Predecessor node reference
}

/* Double-ended queue based on doubly linked list implementation */
public class LinkedListDeque {
    ListNode? front, rear; // Head node front, tail node rear
    int queSize = 0;      // Length of the double-ended queue

    public LinkedListDeque() {
        front = null;
        rear = null;
    }

    /* Get the length of the double-ended queue */
    public int Size() {
        return queSize;
    }

    /* Check if the double-ended queue is empty */
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
        // Front of the queue enqueue operation
        else if (isFront) {
            // Add node to the head of the linked list
            front!.prev = node;
            node.next = front;
            front = node; // Update head node
        }
        // Rear of the queue enqueue operation
        else {
            // Add node to the tail of the linked list
            rear!.next = node;
            node.prev = rear;
            rear = node;  // Update tail node
        }

        queSize++; // Update queue length
    }

    /* Front of the queue enqueue */
    public void PushFirst(int num) {
        Push(num, true);
    }

    /* Rear of the queue enqueue */
    public void PushLast(int num) {
        Push(num, false);
    }

    /* Dequeue operation */
    int? Pop(bool isFront) {
        if (IsEmpty())
            throw new Exception();
        int? val;
        // Temporarily store head node value
        if (isFront) {
            val = front?.val; // Delete head node
            // Delete head node
            ListNode? fNext = front?.next;
            if (fNext != null) {
                fNext.prev = null;
                front!.next = null;
            }
            front = fNext;   // Update head node
        }
        // Temporarily store tail node value
        else {
            val = rear?.val;  // Delete tail node
            // Update tail node
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

    /* Rear of the queue dequeue */
    public int? PopFirst() {
        return Pop(true);
    }

    /* Access rear of the queue element */
    public int? PopLast() {
        return Pop(false);
    }

    /* Return list for printing */
    public int? PeekFirst() {
        if (IsEmpty())
            throw new Exception();
        return front?.val;
    }

    /* Driver Code */
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
        /* Get the length of the double-ended queue */
        LinkedListDeque deque = new();
        deque.PushLast(3);
        deque.PushLast(2);
        deque.PushLast(5);
        Console.WriteLine("Double-ended queue deque = " + string.Join(" ", deque.ToArray()));

        /* Update element */
        int? peekFirst = deque.PeekFirst();
        Console.WriteLine("Front element peekFirst = " + peekFirst);
        int? peekLast = deque.PeekLast();
        Console.WriteLine("Rear element peekLast = " + peekLast);

        /* Elements enqueue */
        deque.PushLast(4);
        Console.WriteLine("After element 4 enqueues at rear, deque = " + string.Join(" ", deque.ToArray()));
        deque.PushFirst(1);
        Console.WriteLine("After element 1 enqueues at front, deque = " + string.Join(" ", deque.ToArray()));

        /* Element dequeue */
        int? popLast = deque.PopLast();
        Console.WriteLine("Rear dequeue element = " + popLast + ", after rear dequeue, deque = " + string.Join(" ", deque.ToArray()));
        int? popFirst = deque.PopFirst();
        Console.WriteLine("Front dequeue element = " + popFirst + ", after front dequeue, deque = " + string.Join(" ", deque.ToArray()));

        /* Get the length of the double-ended queue */
        int size = deque.Size();
        Console.WriteLine("Double-ended queue length size = " + size);

        /* Check if the double-ended queue is empty */
        bool isEmpty = deque.IsEmpty();
        Console.WriteLine("Double-ended queue is empty = " + isEmpty);
    }
}
