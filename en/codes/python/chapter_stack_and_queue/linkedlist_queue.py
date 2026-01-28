"""
File: linkedlist_queue.py
Created Time: 2022-12-01
Author: Peng Chen (pengchzn@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import ListNode


class LinkedListQueue:
    """Queue based on linked list implementation"""

    def __init__(self):
        """Constructor"""
        self._front: ListNode | None = None  # Head node front
        self._rear: ListNode | None = None  # Tail node rear
        self._size: int = 0

    def size(self) -> int:
        """Get the length of the queue"""
        return self._size

    def is_empty(self) -> bool:
        """Check if the queue is empty"""
        return self._size == 0

    def push(self, num: int):
        """Enqueue"""
        # Add num after the tail node
        node = ListNode(num)
        # If the queue is empty, make both front and rear point to the node
        if self._front is None:
            self._front = node
            self._rear = node
        # If the queue is not empty, add the node after the tail node
        else:
            self._rear.next = node
            self._rear = node
        self._size += 1

    def pop(self) -> int:
        """Dequeue"""
        num = self.peek()
        # Delete head node
        self._front = self._front.next
        self._size -= 1
        return num

    def peek(self) -> int:
        """Access front of the queue element"""
        if self.is_empty():
            raise IndexError("Queue is empty")
        return self._front.val

    def to_list(self) -> list[int]:
        """Convert to list for printing"""
        queue = []
        temp = self._front
        while temp:
            queue.append(temp.val)
            temp = temp.next
        return queue


"""Driver Code"""
if __name__ == "__main__":
    # Initialize queue
    queue = LinkedListQueue()

    # Elements enqueue
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    print("queue =", queue.to_list())

    # Access front of the queue element
    peek: int = queue.peek()
    print("Front of the queue element front =", peek)

    # Element dequeue
    pop_front: int = queue.pop()
    print("Dequeued element pop =", pop_front)
    print("After dequeue queue =", queue.to_list())

    # Get the length of the queue
    size: int = queue.size()
    print("Length of the queue size =", size)

    # Check if the queue is empty
    is_empty: bool = queue.is_empty()
    print("Is the queue empty =", is_empty)
