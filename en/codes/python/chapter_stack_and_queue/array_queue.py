"""
File: array_queue.py
Created Time: 2022-12-01
Author: Peng Chen (pengchzn@gmail.com)
"""


class ArrayQueue:
    """Queue backed by a circular array."""

    def __init__(self, size: int):
        """Initialize the queue."""
        self._nums: list[int] = [0] * size  # Array that stores the queue elements
        self._front: int = 0  # Index of the front element
        self._size: int = 0  # Queue size

    def capacity(self) -> int:
        """Get the queue capacity."""
        return len(self._nums)

    def size(self) -> int:
        """Get the queue size."""
        return self._size

    def is_empty(self) -> bool:
        """Check whether the queue is empty."""
        return self._size == 0

    def push(self, num: int):
        """Enqueue an element."""
        if self._size == self.capacity():
            raise IndexError("Queue is full")
        # Compute the index one slot past the rear element
        # Use the remainder to wrap rear back to the start of the array
        rear: int = (self._front + self._size) % self.capacity()
        # Add num at the rear
        self._nums[rear] = num
        self._size += 1

    def pop(self) -> int:
        """Remove and return the front element."""
        num: int = self.peek()
        # Advance the front index by one, wrapping to the start if it passes the end
        self._front = (self._front + 1) % self.capacity()
        self._size -= 1
        return num

    def peek(self) -> int:
        """Peek at the front element."""
        if self.is_empty():
            raise IndexError("Queue is empty")
        return self._nums[self._front]

    def to_list(self) -> list[int]:
        """Return a list for printing."""
        res = [0] * self.size()
        j: int = self._front
        for i in range(self.size()):
            res[i] = self._nums[(j % self.capacity())]
            j += 1
        return res


"""Driver Code"""
if __name__ == "__main__":
    # Initialize the queue
    queue = ArrayQueue(10)

    # Enqueue elements
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    print("queue =", queue.to_list())

    # Peek at the front element
    peek: int = queue.peek()
    print("Front element (peek) =", peek)

    # Dequeue an element
    pop: int = queue.pop()
    print("Dequeued element (pop) =", pop)
    print("After removal, queue =", queue.to_list())

    # Get the queue size
    size: int = queue.size()
    print("Queue size =", size)

    # Check whether the queue is empty
    is_empty: bool = queue.is_empty()
    print("Queue is empty =", is_empty)

    # Test the circular array
    for i in range(10):
        queue.push(i)
        queue.pop()
        print("After round", i, "of enqueueing and dequeueing, queue = ", queue.to_list())
