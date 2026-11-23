"""
File: array_deque.py
Created Time: 2023-03-01
Author: krahets (krahets@163.com)
"""


class ArrayDeque:
    """Deque implemented with a circular array"""

    def __init__(self, capacity: int):
        """Constructor"""
        self._nums: list[int] = [0] * capacity
        self._front: int = 0
        self._size: int = 0

    def capacity(self) -> int:
        """Get the deque capacity"""
        return len(self._nums)

    def size(self) -> int:
        """Get the deque size"""
        return self._size

    def is_empty(self) -> bool:
        """Check whether the deque is empty"""
        return self._size == 0

    def index(self, i: int) -> int:
        """Calculate an index in the circular array"""
        # Use modulo to connect the end of the array to its beginning
        # When i passes the end of the array, wrap around to the beginning
        # When i passes the beginning of the array, wrap around to the end
        return (i + self.capacity()) % self.capacity()

    def push_first(self, num: int):
        """Enqueue at the front"""
        if self._size == self.capacity():
            print("Deque is full")
            return
        # Move the front pointer one position to the left
        # Use modulo to wrap front to the end when it passes the beginning of the array
        self._front = self.index(self._front - 1)
        # Add num to the front
        self._nums[self._front] = num
        self._size += 1

    def push_last(self, num: int):
        """Enqueue at the rear"""
        if self._size == self.capacity():
            print("Deque is full")
            return
        # Calculate the rear pointer, which points one position past the last element
        rear = self.index(self._front + self._size)
        # Add num to the rear
        self._nums[rear] = num
        self._size += 1

    def pop_first(self) -> int:
        """Dequeue from the front"""
        num = self.peek_first()
        # Advance the front pointer by one position
        self._front = self.index(self._front + 1)
        self._size -= 1
        return num

    def pop_last(self) -> int:
        """Dequeue from the rear"""
        num = self.peek_last()
        self._size -= 1
        return num

    def peek_first(self) -> int:
        """Access the front element"""
        if self.is_empty():
            raise IndexError("Deque is empty")
        return self._nums[self._front]

    def peek_last(self) -> int:
        """Access the rear element"""
        if self.is_empty():
            raise IndexError("Deque is empty")
        # Calculate the index of the last element
        last = self.index(self._front + self._size - 1)
        return self._nums[last]

    def to_array(self) -> list[int]:
        """Return an array for printing"""
        # Convert only the list elements within the occupied range
        res = []
        for i in range(self._size):
            res.append(self._nums[self.index(self._front + i)])
        return res


"""Driver code"""
if __name__ == "__main__":
    # Initialize the deque
    deque = ArrayDeque(10)
    deque.push_last(3)
    deque.push_last(2)
    deque.push_last(5)
    print("Deque deque =", deque.to_array())

    # Access an element
    peek_first: int = deque.peek_first()
    print("Front element peek_first =", peek_first)
    peek_last: int = deque.peek_last()
    print("Rear element peek_last =", peek_last)

    # Enqueue elements
    deque.push_last(4)
    print("After enqueuing element 4 at the rear, deque =", deque.to_array())
    deque.push_first(1)
    print("After enqueuing element 1 at the front, deque =", deque.to_array())

    # Dequeue an element
    pop_last: int = deque.pop_last()
    print("Element dequeued from the rear =", pop_last, ", after dequeuing from the rear, deque =", deque.to_array())
    pop_first: int = deque.pop_first()
    print("Element dequeued from the front =", pop_first, ", after dequeuing from the front, deque =", deque.to_array())

    # Get the deque size
    size: int = deque.size()
    print("Deque size =", size)

    # Check whether the deque is empty
    is_empty: bool = deque.is_empty()
    print("Is the deque empty =", is_empty)
