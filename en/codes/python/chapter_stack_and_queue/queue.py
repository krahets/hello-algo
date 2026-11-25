"""
File: queue.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

from collections import deque

"""Driver Code"""
if __name__ == "__main__":
    # Initialize the queue
    # In Python, the double-ended queue class deque is commonly used as a FIFO queue
    # queue.Queue() creates a dedicated queue, but it is less convenient here
    que: deque[int] = deque()

    # Enqueue elements
    que.append(1)
    que.append(3)
    que.append(2)
    que.append(5)
    que.append(4)
    print("que =", que)

    # Peek at the front element
    front: int = que[0]
    print("Front element (front) =", front)

    # Dequeue an element
    pop: int = que.popleft()
    print("Dequeued element (pop) =", pop)
    print("After removal, que =", que)

    # Get the queue size
    size: int = len(que)
    print("Queue size =", size)

    # Check whether the queue is empty
    is_empty: bool = len(que) == 0
    print("Queue is empty =", is_empty)
