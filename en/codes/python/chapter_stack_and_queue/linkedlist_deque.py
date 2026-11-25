"""
File: linkedlist_deque.py
Created Time: 2023-03-01
Author: krahets (krahets@163.com)
"""


class ListNode:
    """Doubly linked list node."""

    def __init__(self, val: int):
        """Initialize the node."""
        self.val: int = val
        self.next: ListNode | None = None  # Reference to the next node
        self.prev: ListNode | None = None  # Reference to the previous node


class LinkedListDeque:
    """Deque backed by a doubly linked list."""

    def __init__(self):
        """Initialize the deque."""
        self._front: ListNode | None = None  # Head node (_front)
        self._rear: ListNode | None = None  # Tail node (_rear)
        self._size: int = 0  # Deque size

    def size(self) -> int:
        """Get the deque size."""
        return self._size

    def is_empty(self) -> bool:
        """Check whether the deque is empty."""
        return self._size == 0

    def push(self, num: int, is_front: bool):
        """Add an element at either end."""
        node = ListNode(num)
        # If the list is empty, point both _front and _rear at node
        if self.is_empty():
            self._front = self._rear = node
        # Add at the front
        elif is_front:
            # Link node at the head of the list
            self._front.prev = node
            node.next = self._front
            self._front = node  # Update the head
        # Add at the rear
        else:
            # Link node at the tail of the list
            self._rear.next = node
            node.prev = self._rear
            self._rear = node  # Update the tail
        self._size += 1  # Update the deque size

    def push_first(self, num: int):
        """Add an element at the front."""
        self.push(num, True)

    def push_last(self, num: int):
        """Add an element at the rear."""
        self.push(num, False)

    def pop(self, is_front: bool) -> int:
        """Remove an element from either end."""
        if self.is_empty():
            raise IndexError("Deque is empty")
        # When the deque contains one element, the head and tail point to the same node
        if self._size == 1:
            val: int = self._front.val
            self._front = None
            self._rear = None
        # Remove from the front
        elif is_front:
            val: int = self._front.val  # Save the head node's value
            # Remove the head node
            fnext: ListNode | None = self._front.next
            fnext.prev = None
            self._front.next = None
            self._front = fnext  # Update the head
        # Remove from the rear
        else:
            val: int = self._rear.val  # Save the tail node's value
            # Remove the tail node
            rprev: ListNode | None = self._rear.prev
            rprev.next = None
            self._rear.prev = None
            self._rear = rprev  # Update the tail
        self._size -= 1  # Update the deque size
        return val

    def pop_first(self) -> int:
        """Remove and return the front element."""
        return self.pop(True)

    def pop_last(self) -> int:
        """Remove and return the rear element."""
        return self.pop(False)

    def peek_first(self) -> int:
        """Peek at the front element."""
        if self.is_empty():
            raise IndexError("Deque is empty")
        return self._front.val

    def peek_last(self) -> int:
        """Peek at the rear element."""
        if self.is_empty():
            raise IndexError("Deque is empty")
        return self._rear.val

    def to_array(self) -> list[int]:
        """Return a list for printing."""
        node = self._front
        res = [0] * self.size()
        for i in range(self.size()):
            res[i] = node.val
            node = node.next
        return res


"""Driver Code"""
if __name__ == "__main__":
    # Initialize the deque
    deque = LinkedListDeque()
    deque.push_last(3)
    deque.push_last(2)
    deque.push_last(5)
    print("deque =", deque.to_array())

    # Peek at the front and rear elements
    peek_first: int = deque.peek_first()
    print("Front element (peek_first) =", peek_first)
    peek_last: int = deque.peek_last()
    print("Rear element (peek_last) =", peek_last)

    # Add elements to the deque
    deque.push_last(4)
    print("After adding 4 at the rear, deque =", deque.to_array())
    deque.push_first(1)
    print("After adding 1 at the front, deque =", deque.to_array())

    # Remove elements from both ends
    pop_last: int = deque.pop_last()
    print("Removed from the rear =", pop_last, "| deque after removal =", deque.to_array())
    pop_first: int = deque.pop_first()
    print("Removed from the front =", pop_first, "| deque after removal =", deque.to_array())

    # Get the deque size
    size: int = deque.size()
    print("Deque size =", size)

    # Check whether the deque is empty
    is_empty: bool = deque.is_empty()
    print("Deque is empty =", is_empty)
