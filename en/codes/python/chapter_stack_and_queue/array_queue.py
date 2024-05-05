"""
File: array_queue.py
Created Time: 2022-12-01
Author: Peng Chen (pengchzn@gmail.com)
"""


class ArrayQueue:
    """Queue class based on circular array"""

    def __init__(self, size: int):
        """Constructor"""
        self._nums: list[int] = [0] * size  # Array for storing queue elements
        self._front: int = 0  # Front pointer, pointing to the front element
        self._size: int = 0  # Queue length

    def capacity(self) -> int:
        """Get the capacity of the queue"""
        return len(self._nums)

    def size(self) -> int:
        """Get the length of the queue"""
        return self._size

    def is_empty(self) -> bool:
        """Determine if the queue is empty"""
        return self._size == 0

    def push(self, num: int):
        """Enqueue"""
        if self._size == self.capacity():
            raise IndexError("Queue is full")
        # Calculate rear pointer, pointing to rear index + 1
        # Use modulo operation to wrap the rear pointer from the end of the array back to the start
        rear: int = (self._front + self._size) % self.capacity()
        # Add num to the rear
        self._nums[rear] = num
        self._size += 1

    def pop(self) -> int:
        """Dequeue"""
        num: int = self.peek()
        # Move front pointer one position backward, returning to the head of the array if it exceeds the tail
        self._front = (self._front + 1) % self.capacity()
        self._size -= 1
        return num

    def peek(self) -> int:
        """Access front element"""
        if self.is_empty():
            raise IndexError("Queue is empty")
        return self._nums[self._front]

    def to_list(self) -> list[int]:
        """Return array for printing"""
        res = [0] * self.size()
        j: int = self._front
        for i in range(self.size()):
            res[i] = self._nums[(j % self.capacity())]
            j += 1
        return res


"""Driver Code"""
if __name__ == "__main__":
    # Initialize queue
    queue = ArrayQueue(10)

    # Element enqueue
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    print("Queue queue =", queue.to_list())

    # Access front element
    peek: int = queue.peek()
    print("Front element peek =", peek)

    # Element dequeue
    pop: int = queue.pop()
    print("Dequeued element pop =", pop)
    print("Queue after dequeue =", queue.to_list())

    # Get the length of the queue
    size: int = queue.size()
    print("Queue length size =", size)

    # Determine if the queue is empty
    is_empty: bool = queue.is_empty()
    print("Is the queue empty =", is_empty)

    # Test circular array
    for i in range(10):
        queue.push(i)
        queue.pop()
        print("In the ", i, "th round of enqueue + dequeue, queue = ", queue.to_list())
