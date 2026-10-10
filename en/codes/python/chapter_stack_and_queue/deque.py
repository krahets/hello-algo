"""
File: deque.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

from collections import deque

"""Driver Code"""
if __name__ == "__main__":
    # Initialize double-ended queue
    deq: deque[int] = deque()

    # Elements enqueue
    deq.append(2)  # Add to the rear of the queue
    deq.append(5)
    deq.append(4)
    deq.appendleft(3)  # Add to the front of the queue
    deq.appendleft(1)
    print("double-ended queue deque =", deq)

    # Access elements
    front: int = deq[0]  # Front of the queue element
    print("Front of the queue element front =", front)
    rear: int = deq[-1]  # Rear of the queue element
    print("Rear of the queue element rear =", rear)

    # Elements dequeue
    pop_front: int = deq.popleft()  # Front of the queue element dequeues
    print("Front dequeued element  pop_front =", pop_front)
    print("After front dequeue deque =", deq)
    pop_rear: int = deq.pop()  # Rear of the queue element dequeues
    print("Rear dequeued element  pop_rear =", pop_rear)
    print("After rear dequeue deque =", deq)

    # Get the length of the double-ended queue
    size: int = len(deq)
    print("Length of the double-ended queue size =", size)

    # Check if the double-ended queue is empty
    is_empty: bool = len(deq) == 0
    print("Is the double-ended queue empty =", is_empty)
