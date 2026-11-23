"""
File: queue.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

from collections import deque

"""Driver code"""
if __name__ == "__main__":
    # Initialize the queue
    # In Python, we generally use the deque class as a queue
    # Although queue.Queue() is a dedicated queue class, deque is more convenient for this example
    que: deque[int] = deque()

    # Enqueue elements
    que.append(1)
    que.append(3)
    que.append(2)
    que.append(5)
    que.append(4)
    print("Queue que =", que)

    # Access the front element
    front: int = que[0]
    print("Front element front =", front)

    # Dequeue an element
    pop: int = que.popleft()
    print("Dequeued element pop =", pop)
    print("After dequeuing, que =", que)

    # Get the queue size
    size: int = len(que)
    print("Queue size =", size)

    # Check whether the queue is empty
    is_empty: bool = len(que) == 0
    print("Is the queue empty =", is_empty)
