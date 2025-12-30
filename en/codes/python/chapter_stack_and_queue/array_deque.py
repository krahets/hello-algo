"""
File: array_deque.py
Created Time: 2023-03-01
Author: krahets (krahets@163.com)
"""


class ArrayDeque:
    """Double-ended queue based on circular array implementation"""

    def __init__(self, capacity: int):
        """Constructor"""
        self._nums: list[int] = [0] * capacity
        self._front: int = 0
        self._size: int = 0

    def capacity(self) -> int:
        """Get the capacity of the double-ended queue"""
        return len(self._nums)

    def size(self) -> int:
        """Get the length of the double-ended queue"""
        return self._size

    def is_empty(self) -> bool:
        """Check if the double-ended queue is empty"""
        return self._size == 0

    def index(self, i: int) -> int:
        """Calculate circular array index"""
        # Use modulo operation to wrap the array head and tail together
        # When i passes the tail of the array, return to the head
        # When i passes the head of the array, return to the tail
        return (i + self.capacity()) % self.capacity()

    def push_first(self, num: int):
        """Front of the queue enqueue"""
        if self._size == self.capacity():
            print("Double-ended queue is full")
            return
        # Front pointer moves one position to the left
        # Use modulo operation to wrap front around to the tail after passing the head of the array
        self._front = self.index(self._front - 1)
        # Add num to the front of the queue
        self._nums[self._front] = num
        self._size += 1

    def push_last(self, num: int):
        """Rear of the queue enqueue"""
        if self._size == self.capacity():
            print("Double-ended queue is full")
            return
        # Calculate rear pointer, points to rear index + 1
        rear = self.index(self._front + self._size)
        # Add num to the rear of the queue
        self._nums[rear] = num
        self._size += 1

    def pop_first(self) -> int:
        """Front of the queue dequeue"""
        num = self.peek_first()
        # Front pointer moves one position backward
        self._front = self.index(self._front + 1)
        self._size -= 1
        return num

    def pop_last(self) -> int:
        """Rear of the queue dequeue"""
        num = self.peek_last()
        self._size -= 1
        return num

    def peek_first(self) -> int:
        """Access front of the queue element"""
        if self.is_empty():
            raise IndexError("Double-ended queue is empty")
        return self._nums[self._front]

    def peek_last(self) -> int:
        """Access rear of the queue element"""
        if self.is_empty():
            raise IndexError("Double-ended queue is empty")
        # Calculate tail element index
        last = self.index(self._front + self._size - 1)
        return self._nums[last]

    def to_array(self) -> list[int]:
        """Return array for printing"""
        # Only convert list elements within the valid length range
        res = []
        for i in range(self._size):
            res.append(self._nums[self.index(self._front + i)])
        return res


"""Driver Code"""
if __name__ == "__main__":
    # Initialize double-ended queue
    deque = ArrayDeque(10)
    deque.push_last(3)
    deque.push_last(2)
    deque.push_last(5)
    print("double-ended queue deque =", deque.to_array())

    # Access elements
    peek_first: int = deque.peek_first()
    print("Front of the queue element peek_first =", peek_first)
    peek_last: int = deque.peek_last()
    print("Rear of the queue element peek_last =", peek_last)

    # Elements enqueue
    deque.push_last(4)
    print("Element 4 rear enqueue after deque =", deque.to_array())
    deque.push_first(1)
    print("Element 1 front enqueue after deque =", deque.to_array())

    # Elements dequeue
    pop_last: int = deque.pop_last()
    print("Rear dequeued element =", pop_last, ", rear dequeue after deque =", deque.to_array())
    pop_first: int = deque.pop_first()
    print("Front dequeued element =", pop_first, ", front dequeue after deque =", deque.to_array())

    # Get the length of the double-ended queue
    size: int = deque.size()
    print("Length of the double-ended queue size =", size)

    # Check if the double-ended queue is empty
    is_empty: bool = deque.is_empty()
    print("Is the double-ended queue empty =", is_empty)
