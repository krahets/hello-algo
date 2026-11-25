"""
File: array_deque.py
Created Time: 2023-03-01
Author: krahets (krahets@163.com)
"""


class ArrayDeque:
    """Deque backed by a circular array."""

    def __init__(self, capacity: int):
        """Initialize the deque."""
        self._nums: list[int] = [0] * capacity
        self._front: int = 0
        self._size: int = 0

    def capacity(self) -> int:
        """Get the deque capacity."""
        return len(self._nums)

    def size(self) -> int:
        """Get the deque size."""
        return self._size

    def is_empty(self) -> bool:
        """Check whether the deque is empty."""
        return self._size == 0

    def index(self, i: int) -> int:
        """Compute the circular array index."""
        # Use the remainder to wrap indices around the array
        # When i goes past the end, wrap it back to the start
        # When i goes before the start, wrap it around to the end
        return (i + self.capacity()) % self.capacity()

    def push_first(self, num: int):
        """Add an element at the front."""
        if self._size == self.capacity():
            print("Deque is full")
            return
        # Move the front index one slot to the left
        # Use the remainder to wrap front to the end if it goes before the start
        self._front = self.index(self._front - 1)
        # Add num at the front
        self._nums[self._front] = num
        self._size += 1

    def push_last(self, num: int):
        """Add an element at the rear."""
        if self._size == self.capacity():
            print("Deque is full")
            return
        # Compute the index one slot past the rear element
        rear = self.index(self._front + self._size)
        # Add num at the rear
        self._nums[rear] = num
        self._size += 1

    def pop_first(self) -> int:
        """Remove and return the front element."""
        num = self.peek_first()
        # Advance the front index by one
        self._front = self.index(self._front + 1)
        self._size -= 1
        return num

    def pop_last(self) -> int:
        """Remove and return the rear element."""
        num = self.peek_last()
        self._size -= 1
        return num

    def peek_first(self) -> int:
        """Peek at the front element."""
        if self.is_empty():
            raise IndexError("Deque is empty")
        return self._nums[self._front]

    def peek_last(self) -> int:
        """Peek at the rear element."""
        if self.is_empty():
            raise IndexError("Deque is empty")
        # Compute the index of the rear element
        last = self.index(self._front + self._size - 1)
        return self._nums[last]

    def to_array(self) -> list[int]:
        """Return a list for printing."""
        # Copy only the elements currently in the deque
        res = []
        for i in range(self._size):
            res.append(self._nums[self.index(self._front + i)])
        return res


"""Driver Code"""
if __name__ == "__main__":
    # Initialize the deque
    deque = ArrayDeque(10)
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
