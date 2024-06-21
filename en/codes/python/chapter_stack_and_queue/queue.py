"""
File: queue.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

from collections import deque

"""Driver Code"""
if __name__ == "__main__":
    # Initialize queue
    # In Python, we generally consider the deque class as a queue
    # Although queue.Queue() is a pure queue class, it's not very user-friendly
    que: deque[int] = deque()

    # Element enqueue
    que.append(1)
    que.append(3)
    que.append(2)
    que.append(5)
    que.append(4)
    print("Queue que =", que)

    # Access front element
    front: int = que[0]
    print("Front element front =", front)

    # Element dequeue
    pop: int = que.popleft()
    print("Dequeued element pop =", pop)
    print("Queue after dequeue =", que)

    # Get the length of the queue
    size: int = len(que)
    print("Queue length size =", size)

    # Determine if the queue is empty
    is_empty: bool = len(que) == 0
    print("Is the queue empty =", is_empty)
