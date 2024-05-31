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
    """Queue class based on linked list"""

    def __init__(self):
        """Constructor"""
        self._front: ListNode | None = None  # Head node front
        self._rear: ListNode | None = None  # Tail node rear
        self._size: int = 0

    def size(self) -> int:
        """Get the length of the queue"""
        return self._size

    def is_empty(self) -> bool:
        """Determine if the queue is empty"""
        return self._size == 0

    def push(self, num: int):
        """Enqueue"""
        # Add num behind the tail node
        node = ListNode(num)
        # If the queue is empty, make the head and tail nodes both point to that node
        if self._front is None:
            self._front = node
            self._rear = node
        # If the queue is not empty, add that node behind the tail node
        else:
            self._rear.next = node
            self._rear = node
        self._size += 1

    def pop(self) -> int:
        """Dequeue"""
        num = self.peek()
        # Remove head node
        self._front = self._front.next
        self._size -= 1
        return num

    def peek(self) -> int:
        """Access front element"""
        if self.is_empty():
            raise IndexError("Queue is empty")
        return self._front.val

    def to_list(self) -> list[int]:
        """Convert to a list for printing"""
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

    # Element enqueue
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    print("Queue queue =", queue.to_list())

    # Access front element
    peek: int = queue.peek()
    print("Front element front =", peek)

    # Element dequeue
    pop_front: int = queue.pop()
    print("Dequeued element pop =", pop_front)
    print("Queue after dequeue =", queue.to_list())

    # Get the length of the queue
    size: int = queue.size()
    print("Queue length size =", size)

    # Determine if the queue is empty
    is_empty: bool = queue.is_empty()
    print("Is the queue empty =", is_empty)
