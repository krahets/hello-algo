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
    """Queue implemented with a linked list"""

    def __init__(self):
        """Constructor"""
        self._front: ListNode | None = None  # Head node front
        self._rear: ListNode | None = None  # Tail node rear
        self._size: int = 0

    def size(self) -> int:
        """Get the queue size"""
        return self._size

    def is_empty(self) -> bool:
        """Check whether the queue is empty"""
        return self._size == 0

    def push(self, num: int):
        """Enqueue"""
        # Add num after the tail node
        node = ListNode(num)
        # If the queue is empty, make both the head and tail point to this node
        if self._front is None:
            self._front = node
            self._rear = node
        # If the queue is not empty, add this node after the tail node
        else:
            self._rear.next = node
            self._rear = node
        self._size += 1

    def pop(self) -> int:
        """Dequeue"""
        num = self.peek()
        # Remove the head node
        self._front = self._front.next
        self._size -= 1
        return num

    def peek(self) -> int:
        """Access the front element"""
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


"""Driver code"""
if __name__ == "__main__":
    # Initialize the queue
    queue = LinkedListQueue()

    # Enqueue elements
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    print("Queue queue =", queue.to_list())

    # Access the front element
    peek: int = queue.peek()
    print("Front element peek =", peek)

    # Dequeue an element
    pop_front: int = queue.pop()
    print("Dequeued element pop_front =", pop_front)
    print("After dequeuing, queue =", queue.to_list())

    # Get the queue size
    size: int = queue.size()
    print("Queue size =", size)

    # Check whether the queue is empty
    is_empty: bool = queue.is_empty()
    print("Is the queue empty =", is_empty)
