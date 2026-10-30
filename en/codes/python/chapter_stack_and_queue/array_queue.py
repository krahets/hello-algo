"""
File: array_queue.py
Created Time: 2022-12-01
Author: Peng Chen (pengchzn@gmail.com)
"""


class ArrayQueue:
    """Queue implemented with a circular array"""

    def __init__(self, size: int):
        """Constructor"""
        self._nums: list[int] = [0] * size  # Array that stores the queue elements
        self._front: int = 0  # Front pointer, pointing to the first element
        self._size: int = 0  # Queue size

    def capacity(self) -> int:
        """Get the queue capacity"""
        return len(self._nums)

    def size(self) -> int:
        """Get the queue size"""
        return self._size

    def is_empty(self) -> bool:
        """Check whether the queue is empty"""
        return self._size == 0

    def push(self, num: int):
        """Enqueue"""
        if self._size == self.capacity():
            raise IndexError("Queue is full")
        # Calculate the rear pointer, which points one position past the last element
        # Use modulo to wrap rear to the beginning when it passes the end of the array
        rear: int = (self._front + self._size) % self.capacity()
        # Add num to the rear
        self._nums[rear] = num
        self._size += 1

    def pop(self) -> int:
        """Dequeue"""
        num: int = self.peek()
        # Advance the front pointer by one position, wrapping to the beginning if it passes the end
        self._front = (self._front + 1) % self.capacity()
        self._size -= 1
        return num

    def peek(self) -> int:
        """Access the front element"""
        if self.is_empty():
            raise IndexError("Queue is empty")
        return self._nums[self._front]

    def to_list(self) -> list[int]:
        """Return a list for printing"""
        res = [0] * self.size()
        j: int = self._front
        for i in range(self.size()):
            res[i] = self._nums[(j % self.capacity())]
            j += 1
        return res


"""Driver code"""
if __name__ == "__main__":
    # Initialize the queue
    queue = ArrayQueue(10)

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
    pop: int = queue.pop()
    print("Dequeued element pop =", pop)
    print("After dequeuing, queue =", queue.to_list())

    # Get the queue size
    size: int = queue.size()
    print("Queue size =", size)

    # Check whether the queue is empty
    is_empty: bool = queue.is_empty()
    print("Is the queue empty =", is_empty)

    # Test the circular array
    for i in range(10):
        queue.push(i)
        queue.pop()
        print("Round", i, ": after enqueue + dequeue, queue = ", queue.to_list())
