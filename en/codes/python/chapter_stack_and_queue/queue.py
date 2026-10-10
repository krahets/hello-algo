"""
File: queue.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

from collections import deque

"""Driver Code"""
if __name__ == "__main__":
    # Initialize queue
    # In Python, we generally use the double-ended queue class deque as a queue
    # Although queue.Queue() is a proper queue class, it is not very convenient to use
    que: deque[int] = deque()

    # Elements enqueue
    que.append(1)
    que.append(3)
    que.append(2)
    que.append(5)
    que.append(4)
    print("queue que =", que)

    # Access front of the queue element
    front: int = que[0]
    print("Front of the queue element front =", front)

    # Element dequeue
    pop: int = que.popleft()
    print("Dequeued element pop =", pop)
    print("After dequeue que =", que)

    # Get the length of the queue
    size: int = len(que)
    print("Length of the queue size =", size)

    # Check if the queue is empty
    is_empty: bool = len(que) == 0
    print("Is the queue empty =", is_empty)
